/*
 * memory_freebsd2.c
 */

#include <config.h>


/* Ripped from /usr/scr/usr.bin/vmstat/vmstat.c (covering all bases) */
#include <sys/param.h>
#include <sys/time.h>
#include <sys/proc.h>
#include <sys/dkstat.h>
#include <sys/buf.h>
#include <sys/uio.h>
#include <sys/namei.h>
#include <sys/malloc.h>
#include <sys/signal.h>
#include <sys/fcntl.h>
#include <sys/ioctl.h>
#include <sys/sysctl.h>
#include <sys/vmmeter.h>
 
#include <vm/vm_param.h>
 
#include <time.h>
#include <nlist.h>
#include <kvm.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <paths.h>
#include <limits.h>

#if HAVE_DMALLOC_H
#include <dmalloc.h>
#endif

#include "mibincl.h"
#include "util_funcs.h"
#include "auto_nlist.h"

#include "memory.h"

/* nlist symbols */
#define SUM_SYMBOL      "cnt"
#define BUFSPACE_SYMBOL "bufspace"

/* Default swap warning limit (kb) */
#define DEFAULTMINIMUMSWAP 16000

/* Swap warning limit */
long minimumswap;

/* Swap info */
quad_t swapTotal;
quad_t swapUsed;
quad_t swapFree;

void init_memory_freebsd2(void) 
{
  
  struct variable2 extensible_mem_variables[] = {
    {MIBINDEX, ASN_INTEGER, RONLY, var_extensible_mem,1,{MIBINDEX}},
    {ERRORNAME, ASN_OCTET_STR, RONLY, var_extensible_mem, 1, {ERRORNAME }},
    {MEMTOTALSWAP, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMTOTALSWAP}},
    {MEMAVAILSWAP, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMAVAILSWAP}},
    {MEMTOTALREAL, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMTOTALREAL}},
    {MEMAVAILREAL, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMAVAILREAL}},
    {MEMTOTALSWAPTXT, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMTOTALSWAPTXT}},
    {MEMUSEDSWAPTXT, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMUSEDSWAPTXT}},
    {MEMTOTALREALTXT, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMTOTALREALTXT}},
    {MEMUSEDREALTXT, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMUSEDREALTXT}},
    {MEMTOTALFREE, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMTOTALFREE}},
    {MEMSWAPMINIMUM, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMSWAPMINIMUM}},
    {MEMSHARED, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMSHARED}},
    {MEMBUFFER, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMBUFFER}},
    {MEMCACHED, ASN_INTEGER, RONLY, var_extensible_mem, 1, {MEMCACHED}},
    {ERRORFLAG, ASN_INTEGER, RONLY, var_extensible_mem, 1, {ERRORFLAG }},
    {ERRORMSG, ASN_OCTET_STR, RONLY, var_extensible_mem, 1, {ERRORMSG }}
  };

/* Define the OID pointer to the top of the mib tree that we're
   registering underneath */
  oid mem_variables_oid[] = { EXTENSIBLEMIB,MEMMIBNUM };

  /* register ourselves with the agent to handle our mib tree */
  REGISTER_MIB("ucd-snmp/memory", extensible_mem_variables, variable2, \
               mem_variables_oid);

  snmpd_register_config_handler("swap", memory_parse_config,
                                memory_free_config,"min-avail");
}


void memory_parse_config(const char *token, char *cptr)
{
  minimumswap = atoi(cptr);
}
 
void memory_free_config (void)
{
  minimumswap = DEFAULTMINIMUMSWAP;
}

#ifndef freebsd4
/* Executes swapinfo and parses last line */
/* This is just way too ugly ;) */

void swapmode(void)
{
  struct extensible ext;
  int fd;
  FILE *file;

  strcpy(ext.command, "/usr/sbin/swapinfo -k");

  if ( (fd = get_exec_output(&ext)) )
  {
      file = fdopen(fd,"r");

      while (fgets(ext.output,STRMAX,file) != NULL);
      
      fclose(file);
      wait_on_exec(&ext);

      sscanf(ext.output, "%*s%*d%qd%qd", &swapUsed, &swapFree);

      swapTotal = swapUsed + swapFree;
  }
}
#else
/*
 * swapmode is based on a program called swapinfo written
 * by Kevin Lahey <kml@rokkaku.atl.ga.us>.
 */

#include <sys/conf.h>

#define NSWDEV_SYMBOL     "nswdev"
#define DMMAX_SYMBOL      "dmmax"
#define SWDEVT_SYMBOL     "swdevt"

void swapmode(void)
{
    char *header;
    int hlen, nswdev, dmmax;
    int i, idiv, n;
    struct swdevt *sw;
    long blocksize;
    static kvm_t *kd = NULL;
    struct kvm_swap kswap[16];

    if (kd == NULL)
	kd = kvm_openfiles(NULL, NULL, NULL, O_RDONLY, NULL);

    auto_nlist(NSWDEV_SYMBOL, (char *)&nswdev, sizeof (nswdev));
    auto_nlist(DMMAX_SYMBOL, (char *)&dmmax, sizeof (dmmax));

    sw = (struct swdevt *)malloc(nswdev * sizeof(*sw));
    if (sw == NULL) return;

    auto_nlist(SWDEVT_SYMBOL, (char *)sw, nswdev * sizeof(*sw));

    n = kvm_getswapinfo(
        kd,
        kswap,
        sizeof(kswap)/sizeof(kswap[0]),
        0
    );

    swapUsed = swapTotal = swapFree = 0;
    /* Count up free swap space. */
    for (i = 0; i < n; ++i)
        swapFree += kswap[i].ksw_total - kswap[i].ksw_used;

    /* Count up total swap space */
    for (i = 0; i < n; i++) 
	    swapTotal += kswap[i].ksw_total;
    
    /* Calculate used swap space */
    swapUsed = swapTotal - swapFree;

    /* Convert to kb */
    header = getbsize(&hlen, &blocksize);
    idiv = blocksize / 512;

    if (idiv > 0) {
        swapTotal /= idiv;
        swapUsed /= idiv;
        swapFree /= idiv;
    }

    free(sw); 
}
#endif


/*
  var_extensible_mem(...
  Arguments:
  vp	  IN      - pointer to variable entry that points here
  name    IN/OUT  - IN/name requested, OUT/name found
  length  IN/OUT  - length of IN/OUT oid's 
  exact   IN      - TRUE if an exact match was requested
  var_len OUT     - length of variable or 0 if function returned
  write_method
  
*/

unsigned char *var_extensible_mem(struct variable *vp,
				  oid *name,
				  size_t *length,
				  int exact,
				  size_t *var_len,
				  WriteMethod **write_method)
{
    static long long_ret;
    static char errmsg[300];

    static struct vmmeter mem;
    static struct vmtotal total;
    size_t total_size = sizeof (total);
    int total_mib[] = { CTL_VM, VM_METER };

    long phys_mem;
    size_t phys_mem_size = sizeof(phys_mem);
    int phys_mem_mib[] = { CTL_HW, HW_USERMEM };

    long bufspace;
 
    if (header_generic(vp,name,length,exact,var_len,write_method))
	return(NULL);

    /* Memory info */
    auto_nlist(SUM_SYMBOL, (char *)&mem, sizeof (mem));
    sysctl(total_mib, 2, &total, &total_size, NULL, 0);

    /* Swap info */
    swapmode();
    /* getSwap(); */

    /* Physical memory */
    sysctl(phys_mem_mib, 2, &phys_mem, &phys_mem_size, NULL, 0);

    /* Buffer space */
    auto_nlist(BUFSPACE_SYMBOL, (char *)&bufspace, sizeof (bufspace));

    long_ret = 0;  /* set to 0 as default */

/* Page-to-kb macro */
#define ptok(p) ((p) * (mem.v_page_size >> 10))

    switch (vp->magic) {
    case MIBINDEX:
	long_ret = 0;
	return((u_char *) (&long_ret));
    case ERRORNAME:    /* dummy name */
	sprintf(errmsg,"swap");
	*var_len = strlen(errmsg);
	return((u_char *) (errmsg));
    case MEMTOTALSWAP:
	long_ret = swapTotal;
	return((u_char *) (&long_ret));
    case MEMAVAILSWAP: /* FREE swap memory */
	long_ret = swapFree;
	return((u_char *) (&long_ret));
    case MEMTOTALREAL:
	long_ret = phys_mem >> 10;
	return((u_char *) (&long_ret));
    case MEMAVAILREAL: /* FREE real memory */
	long_ret = ptok(mem.v_free_count);
	return((u_char *) (&long_ret));

/* these are not implemented */
    case MEMTOTALSWAPTXT:
    case MEMUSEDSWAPTXT:
    case MEMTOTALREALTXT:
    case MEMUSEDREALTXT:
#if NO_DUMMY_VALUES
	return NULL;
#endif
	long_ret = -1;
	return((u_char *) (&long_ret));

    case MEMTOTALFREE:
	long_ret = ptok((int)total.t_free);
	return((u_char *) (&long_ret));
    case MEMSWAPMINIMUM:
	long_ret = minimumswap;
	return((u_char *) (&long_ret));
    case MEMSHARED:
	long_ret = ptok(total.t_vmshr + 
			total.t_avmshr + 
			total.t_rmshr + 
			total.t_armshr);
	return((u_char *) (&long_ret));
    case MEMBUFFER:
	long_ret = bufspace >> 10;
	return((u_char *) (&long_ret));
    case MEMCACHED:
	long_ret = ptok(mem.v_cache_count);
	return((u_char *) (&long_ret));
    case ERRORFLAG:
	long_ret = (swapFree > minimumswap)?0:1;
	return((u_char *) (&long_ret));
    case ERRORMSG:
	if (swapFree < minimumswap)
	    sprintf(errmsg,"Running out of swap space (%qd)", swapFree);
	else
	    errmsg[0] = 0;
	*var_len = strlen(errmsg);
	return((u_char *) (errmsg));
    }
    return NULL;
}

