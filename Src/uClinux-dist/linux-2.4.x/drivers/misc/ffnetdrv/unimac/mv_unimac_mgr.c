/* 
 * Copyright 2002, Marvell International Ltd.
 * 
 * THIS CODE CONTAINS CONFIDENTIAL INFORMATION OF MARVELL SEMICONDUCTOR, INC.
 * NO RIGHTS ARE GRANTED HEREIN UNDER ANY PATENT, MASK WORK RIGHT OR COPYRIGHT
 * OF MARVELL OR ANY THIRD PARTY. MARVELL RESERVES THE RIGHT AT ITS SOLE
 * DISCRETION TO REQUEST THAT THIS CODE BE IMMEDIATELY RETURNED TO MARVELL.
 * THIS CODE IS PROVIDED "AS IS". MARVELL MAKES NO WARRANTIES, EXPRESS, IMPLIED
 * OR OTHERWISE, REGARDING ITS ACCURACY, COMPLETENESS OR PERFORMANCE.
 */

/*
 * FILENAME:    $Workfile: mv_unimac_mgr.c $
 * REVISION:    $Revision: 9 $
 * LAST UPDATE: $Modtime: 12/31/02 4:41p $
 *
 * DESCRIPTION:
 *     This file implements ???.
 */

/*#define MV_DEBUG*/

#include "mv_platform.h"
#include "mv_os.h"
#include "mv_debug.h"
#include "mv_qd.h"
#include "mv_unimac.h"


typedef struct
{
    MV_UNM_VID		vidOfPort[GT_NUM_OF_SWITCH_PORTS];     /* map port to VLAN  */
    int				numberOfVids;
	GT_U32			cpuPortBitmask;
    GT_U32 			portsOfVid[MV_UNM_MAX_VID];  
	int  			numPortsOfVid[MV_UNM_MAX_VID];   
    GT_BOOL			initiatedVids[MV_UNM_MAX_VID];
} MV_UNM_NETCONFIG;

static GT_BOOL			mvUnmIsInitialized = GT_FALSE;

static MV_UNM_NETCONFIG	mvUnmNetConfig;

const MV_UNM_CONFIG		mvUnmDefaultConfig = {1, 2, 2, 2, 2, 1, MV_UNM_VID_DISABLED}; 

extern GT_QD_DEV       	*qd_dev;

extern GT_STATUS mvDisassociatePort(int qdPort, int fromVlanId, 
									int newPortsBitMask);

extern GT_STATUS mvAssociatePort(int qdPort, int toVlanId, 
								 int newPortsBitMask, int numOfPorts);

void	mvUnmPrintStatus(void);

/* Convert portMask to portList, exclude itself and set vlan port group */
static GT_STATUS	mvUnmSetVlanPortMask(int port, GT_U32	portMask)
{
	GT_STATUS	status;
	GT_LPORT	portList[GT_NUM_OF_SWITCH_PORTS];
	int			i, idx=0;
	
	for(i=0; i<GT_NUM_OF_SWITCH_PORTS; i++)
	{
		if(i == port)
			continue;

		if( GT_CHKBIT(portMask, i) )
		{
			portList[idx] = i;
			idx++;
		}
	}
	status = gvlnSetPortVlanPorts(qd_dev, port, portList, (GT_U8)idx);
	if(status != GT_OK)
	{
		gtOsPrintf("gvlnSetPortVlanPorts fail. Status = 0x%x\n", status);				
		return status;
	}

	return GT_OK;
}

/* Convert VID to string name */
static char*  mvUnmGetVlanName(int vid, char* name)
{
	switch(vid)
	{
		case MV_UNM_VID_DISABLED:
			sprintf(name, "DISABLED(%d)", vid);
			break;
		case MV_UNM_VID_ISOLATED:
			sprintf(name, "ISOLATED(%d)", vid);
			break;
		default:
			sprintf(name, "VLAN_%d", vid);
	}
	return name;
}

/* This function initializes the network configuration data structure */
static GT_STATUS mvUnmNetConfigInit(IN const MV_UNM_CONFIG* pUnmConfig)
{
	MV_UNM_NETCONFIG	nc;	
    int					port, vid;

    for(vid=0; vid<MV_UNM_MAX_VID; vid++)
	{
        nc.initiatedVids[vid] = GT_FALSE;
		nc.portsOfVid[vid] = 0;
		nc.numPortsOfVid[vid] = 0;
	}    
	nc.numberOfVids   = 0;
    nc.cpuPortBitmask = 0;

	/* ISOLATED and DISABLED VLANs always initiated */
	nc.initiatedVids[MV_UNM_VID_ISOLATED] = GT_TRUE;
	nc.initiatedVids[MV_UNM_VID_DISABLED] = GT_TRUE;

    for(port=0; port<GT_NUM_OF_SWITCH_PORTS; port++)
    {
		if(port == GT_CPU_SWITCH_PORT)
			continue;

		vid = pUnmConfig->vidOfPort[port];
		if(nc.initiatedVids[vid] == GT_FALSE)
		{
			nc.initiatedVids[vid] = GT_TRUE;
			nc.numberOfVids++;
		}
		nc.numPortsOfVid[vid]++;
		GT_SETBIT(nc.portsOfVid[vid], port); 
		nc.vidOfPort[port] = vid;
		if( (vid != MV_UNM_VID_ISOLATED) && (vid != MV_UNM_VID_DISABLED) )
			GT_SETBIT(nc.cpuPortBitmask, port);
    }   
    memcpy(&mvUnmNetConfig, &nc, sizeof(nc));

	return GT_OK;
}


/*******************************************************************************
* mvUnmInitialize - initialize UniMAC manager
*
* DESCRIPTION:
*		Restore and initialize the UniMAC network configuration 
*		data structure
* 	
* INPUT: None

* RETURN:		
*		GT_OK			- on success
*		GT_BAD_PARAM	- if both unmConfig pointer and restoreCallback
*						are NULL or the unmConfig is not properly initialized 
*		GT_FAIL			- otherwise
*******************************************************************************/
GT_STATUS  mvUnmInitialize(void)
{	
	GT_STATUS		status = GT_OK;
	MV_UNM_CONFIG	unmConfig;
	GT_U32			portMask;
	int				port;

	if( (getNetConfig(&unmConfig) != GT_OK) ) 
	{
		gtOsPrintf("Can't get netConfig: Use default\n");
		status = mvUnmNetConfigInit(&mvUnmDefaultConfig);
	}
	else
	{
		status = mvUnmNetConfigInit(&unmConfig);
	}
	if (status != GT_OK)
	{
		gtOsPrintf("Can't Init netConfig: status = 0x%x\n", status);
		return status;
	}
    
#ifdef MV_DEBUG
	mvUnmPrintStatus();	
#endif

	/* Create ISOLATED Vlan */
	portMask = mvUnmNetConfig.portsOfVid[MV_UNM_VID_ISOLATED];
	if(portMask != 0)
	{
		status = mvUnmCreateVlan(MV_UNM_VID_ISOLATED, portMask);
		if (status != GT_OK)
		{
			gtOsPrintf("Can't create ISOLATED VID for portMask = %d: status = 0x%x\n", 
						portMask, status);
			return status;
		}
	}
	/* Disable ports belongs to DISABLED Vlan */
	portMask = mvUnmNetConfig.portsOfVid[MV_UNM_VID_DISABLED];
	for(port=0; port<GT_NUM_OF_SWITCH_PORTS; port++)
	{
		if( GT_CHKBIT(portMask, port) )
		{
			status = gstpSetPortState(qd_dev, port, GT_PORT_DISABLE);
			if (status != GT_OK)
			{
				gtOsPrintf("Can't disable port %d: status = 0x%x\n", port, status);
				return status;
			}
		}
	}

	mvUnmIsInitialized  = GT_TRUE;
	return GT_OK;
}

/*******************************************************************************
* mvUnmGetNetConfig - Get port map association table
*
* DESCRIPTION:
*		Return existing UniMAC configuration to caller
*		
* INPUT:
*		None
*					
* OUTPUT:
*		unmConfig - pointer to network configuration structure
* RETURN:		
*		GT_OK	on success
*		GT_FAIL on error
*
* COMMENTS:
*******************************************************************************/

GT_STATUS mvUnmGetNetConfig(OUT MV_UNM_CONFIG *config)
{
	if(mvUnmIsInitialized == GT_FALSE)
		return GT_FAIL;

	memcpy(config, &mvUnmNetConfig.vidOfPort, sizeof(MV_UNM_CONFIG) );
	return GT_OK;
}

/*******************************************************************************
* mvUnmPortMoveTo - move to specific VLAN. Port 5 cannot be used in this function
*					Moving port to MV_UNM_VID_DISABLED VLAN cause this port to be 
*					disabled
* DESCRIPTION:
*		Move port to specific VLAN. 
* 		Port 5 cannot be used in this function
* INPUT:
*		qdPort:				port number
*		vid: 				VLAN id
* 	   
* OUTPUT:
*		None
* RETURN:		
*		GT_OK			on success
*		GT_BAD_PARAM	if a port number is invalid
*		GT_FAIL			on driver error
*
*******************************************************************************/
GT_STATUS mvUnmPortMoveTo(IN int qdPort, IN const MV_UNM_VID vid)
{	
	GT_STATUS			status = GT_OK;
	int					port, oldVid, vidPortNum, oldVidPortNum;
	GT_U32				oldVidPortMask, vidPortMask, cpuPortMask;

	if(mvUnmIsInitialized == GT_FALSE)
		return GT_FAIL;

	if( (vid >= MV_UNM_MAX_VID) || 
		(vid < 0) )
	{
		return GT_BAD_PARAM;
	}

	if( (qdPort == GT_CPU_SWITCH_PORT) || (qdPort < 0) || 
		(qdPort >= GT_NUM_OF_SWITCH_PORTS) )
	{
		return GT_BAD_PARAM;
	}

	if(mvUnmNetConfig.vidOfPort[qdPort] == vid)
	{
		/* Nothing to do. The port already belong to this vid */
		return GT_OK;
	}

	/* Check if we perform the valid operation */	
	if (mvUnmNetConfig.initiatedVids[vid] == GT_FALSE) 
	{ 
		/* Cannot create new VLAN */
		return GT_NOT_INITIALIZED;
	}

	oldVid = mvUnmNetConfig.vidOfPort[qdPort];

	/* Disable port */
	if(oldVid != MV_UNM_VID_DISABLED)
	{
		status = gstpSetPortState(qd_dev, qdPort, GT_PORT_DISABLE);
		if (status != GT_OK)
		{
			return status;
		}
	}
   
	oldVidPortMask = mvUnmNetConfig.portsOfVid[oldVid]; 
	GT_CLRBIT(oldVidPortMask, qdPort);
	oldVidPortNum = mvUnmNetConfig.numPortsOfVid[oldVid];
	oldVidPortNum--;
	cpuPortMask = mvUnmNetConfig.cpuPortBitmask;

	if( (oldVid != MV_UNM_VID_DISABLED) && (oldVid != MV_UNM_VID_ISOLATED) )
	{
		status = mvDisassociatePort(qdPort, oldVid, oldVidPortMask);
		if (status != GT_OK)
		{
			return status;
		}
		GT_CLRBIT(cpuPortMask, qdPort);
		GT_SETBIT(oldVidPortMask, GT_CPU_SWITCH_PORT);
	}

	vidPortMask = mvUnmNetConfig.portsOfVid[vid]; 
	GT_SETBIT(vidPortMask, qdPort);
	vidPortNum = mvUnmNetConfig.numPortsOfVid[vid];
	vidPortNum++;

	if( (vid != MV_UNM_VID_DISABLED) && (vid != MV_UNM_VID_ISOLATED) )
	{
		status = mvAssociatePort(qdPort, vid, vidPortMask, vidPortNum);
		if (status != GT_OK)
		{
			return status;
		}
		GT_SETBIT(cpuPortMask, qdPort);
		GT_SETBIT(vidPortMask, GT_CPU_SWITCH_PORT);
	}

	/* Update portList for all ports belong to oldVid and vid */
	for(port=0; port<GT_NUM_OF_SWITCH_PORTS; port++)
	{
		if(port == GT_CPU_SWITCH_PORT)
		{
			mvUnmSetVlanPortMask(port, cpuPortMask);
			continue;
		}

		if( GT_CHKBIT(vidPortMask, port) )
			mvUnmSetVlanPortMask(port, vidPortMask);

		if( GT_CHKBIT(oldVidPortMask, port) )
			mvUnmSetVlanPortMask(port, oldVidPortMask);
	}

	/* Update PVID ??? of the moved port */
	status = gvlnSetPortVid(qd_dev, (GT_LPORT)qdPort, (GT_U16)vid);
	if(status != GT_OK)
	{
		gtOsPrintf("gvlnSetPortVid failed: status = 0x%x\n", status); 
		return status;
	}			

	/* Enable port */
	if(vid != MV_UNM_VID_DISABLED)
	{
		status = gstpSetPortState(qd_dev, qdPort, GT_PORT_FORWARDING);
		if (status != GT_OK)
		{
			return status;
		}
	}

	/* update new configuration if no error occurrs */ 
	GT_CLRBIT(vidPortMask, GT_CPU_SWITCH_PORT);
	GT_CLRBIT(oldVidPortMask, GT_CPU_SWITCH_PORT);
	mvUnmNetConfig.portsOfVid[oldVid] = oldVidPortMask; 
	mvUnmNetConfig.portsOfVid[vid] = vidPortMask; 
	mvUnmNetConfig.numPortsOfVid[oldVid] = oldVidPortNum;
	mvUnmNetConfig.numPortsOfVid[vid] = vidPortNum;
	mvUnmNetConfig.vidOfPort[qdPort] = vid;
	mvUnmNetConfig.cpuPortBitmask = cpuPortMask;

#ifdef MV_DEBUG
	MV_DEBUG_PRINT("port %d moved from vlan %d to vlan %d\n", qdPort, oldVid, vid);
#endif

	return GT_OK;	
}

/* Create port based VLAN */
GT_STATUS mvUnmCreateVlan(int vid, GT_U32 vlanPortMask)
{
	GT_STATUS	status = GT_OK;
	GT_LPORT	port;
	GT_U32		portMask;
	MV_UNM_VID	portVid;
    
#ifdef MV_DEBUG
	MV_DEBUG_PRINT("Create VLAN %d: PortMask = 0x%X\n", vid, vlanPortMask);
#endif

	if( (vid <= MV_UNM_VID_DISABLED) || (vid >= MV_UNM_MAX_VID) )
		return GT_BAD_PARAM;

	if(mvUnmNetConfig.initiatedVids[vid] == GT_FALSE)
		return GT_NOT_INITIALIZED;

	 /*  set PVID for each port. ??? */
	for(port=0; port<GT_NUM_OF_SWITCH_PORTS; port++)
	{
		portVid = vid;
		if(port == GT_CPU_SWITCH_PORT)
		{
			portMask = mvUnmNetConfig.cpuPortBitmask;
		}
		else
		{
			if( GT_CHKBIT(vlanPortMask, port) )
			{
				/* port belong this vlan */
				status = gvlnSetPortVid(qd_dev, (GT_LPORT)port, (GT_U16)vid);
				if(status != GT_OK)
				{
					gtOsPrintf("gvlnSetPortVid failed: status = 0x%x\n", status); 
					return status;
				}			
				portMask = vlanPortMask;		
				status = gvlnSetPortVlanDBNum(qd_dev, (GT_LPORT)port, (GT_U8)(vid - 1));
				if(status != GT_OK)
				{
					gtOsPrintf("gvlnSetPortVlanDBNum failed: status = 0x%x\n", status); 
					return status;
				}
			}
			else
			{
				portVid = mvUnmNetConfig.vidOfPort[port];
				/* port is not belong this vlan */
				portMask = mvUnmNetConfig.portsOfVid[portVid];
			}
			/* Add CPU port if vid != ISOLATED */
			if( (portVid != MV_UNM_VID_ISOLATED) && (portVid != MV_UNM_VID_DISABLED) )
				GT_SETBIT(portMask, GT_CPU_SWITCH_PORT);
		}
		status = mvUnmSetVlanPortMask(port, portMask);
		if(status != GT_OK)
		{
			return status;
		}
	}
	return GT_OK;
}

/* Return port mask belong this vid */
INLINE GT_U32		mvUnmGetPortMaskOfVid(MV_UNM_VID vid)
{
	return mvUnmNetConfig.portsOfVid[vid];
}
                                   

/* Return vid, that port belong to */
INLINE MV_UNM_VID	mvUnmGetVidOfPort(int port)
{
	return mvUnmNetConfig.vidOfPort[port];
}

/* Return total number of vids, without ISOLATED and DISABLED  */
INLINE int			mvUnmGetNumOfVlans(void)
{
	return mvUnmNetConfig.numberOfVids;
}


void	mvUnmPrintStatus(void)
{
	int		vid, port;
	char	name[20];

	if(mvUnmIsInitialized == GT_FALSE)
		gtOsPrintf("UNM is not initialized yet\n");

	gtOsPrintf("%d VLANs created: CpuPortMask = 0x%x\n", 
				mvUnmNetConfig.numberOfVids, mvUnmNetConfig.cpuPortBitmask);
	for(vid=0; vid<MV_UNM_MAX_VID; vid++)
	{
		mvUnmGetVlanName(vid, name);
		if(mvUnmNetConfig.initiatedVids[vid] == GT_TRUE)
		{
			gtOsPrintf("vid=%d: %12s, portMask=0x%02x, portNum=%d\n", 
						vid, name, mvUnmNetConfig.portsOfVid[vid], 
						mvUnmNetConfig.numPortsOfVid[vid]);
		}
	}
	gtOsPrintf("Port - Vlan\n");
	for(port=0; port<GT_NUM_OF_SWITCH_PORTS; port++)
	{
		if(port == GT_CPU_SWITCH_PORT)
			sprintf(name, "VLAN_ALL");
		else
			mvUnmGetVlanName(mvUnmNetConfig.vidOfPort[port], name);
		gtOsPrintf(" %d  - %s\n", port, name);
	}
}
