#include <stdio.h>
#include <string.h>
#include "httpd.h"
#include "nvram.h"

#define MIN(a,b) ((a) < (b) ? (a) : (b))
#define WWWROOT_DIR "./public_html/"
void
do_auth(char *userid, char *passwd, char *realm)
{
	strncpy(userid, "admin", AUTH_MAX);
	strncpy(passwd, "rubinxu", AUTH_MAX);
	strncpy(realm, "Router Admin", AUTH_MAX);
}


int is_fileexist(char *filename) {
	FILE *fp;

	fp = fopen(filename, "r");

	if (fp == NULL)
		return 0;
	fclose(fp);
	return 1;
}

int
do_file(char *path, FILE *stream)
{
        FILE *fp;
        int c;
        char filepath[256];

        strncpy(filepath, WWWROOT_DIR, sizeof(filepath) - 1);
        strncat(filepath, path, sizeof(filepath) - 1 - strlen(WWWROOT_DIR));
        filepath[sizeof(filepath) - 1] = '\0';

        if (!(fp = fopen(filepath, "r")))
                return 0;
        while ((c = fgetc(fp)) != EOF)
                fputc(c, stream);
        fclose(fp);
        return 1;
}

int
do_config_get(char *path, FILE *stream)
{
	char nvram_content[64];
	char* nvram_variable;

	nvram_variable = strrchr(path, '/');
	if (nvram_variable) nvram_variable++;

	fputs("{\"status\": ", stream);
	if (nvram_variable)
	{
		if (nvram_get_variable(nvram_variable, nvram_content, sizeof(nvram_content)))
		{
			fputs("\"ok\", \"value\" : \"", stream);
			fputs(nvram_content, stream);
			fputs("\"}", stream);
		}
		else
			fputs("\"ok\", \"value\" : null}", stream);
	}
	else
		fputs("\"error-unknown-variable\"}", stream);
	return 1;
}


char post_buf[10000];
int pbuf_ptr;
void pbuf_insert_char(char c)
{
	if (pbuf_ptr < sizeof(post_buf)-1)
		post_buf[pbuf_ptr++] = c;
}
char* pbuf_mkstr()
{
	char* ptr;
	if (pbuf_ptr && pbuf_ptr < sizeof(post_buf))
	{
		for(ptr = post_buf + pbuf_ptr - 1; (ptr != post_buf) && (*ptr); ptr--){}
		post_buf[pbuf_ptr++] = '\0';
		return (ptr == post_buf) ? ptr : ptr + 1;
	}
	else
		return NULL;
}
void pbuf_clear() {
	pbuf_ptr = 0;
}

struct {
	char* field_name;
	char *field_value;
} formdata[20];
void
do_parse_postform(char *url, FILE *stream, int len, char *boundary)
{
	char c;
	enum {VAR_NAME, VAR_VALUE};
	int state = VAR_NAME;
	int formdata_cnt = 0;
	pbuf_clear();
	while(len && fread(&c, 1, 1, stream))
	{
		len--;
		switch(state)
		{
		case VAR_NAME:
			if (c == '=')
			{
				state = VAR_VALUE;
				formdata[formdata_cnt].field_name = pbuf_mkstr();
			}
			else
				pbuf_insert_char(c);
			break;
		case VAR_VALUE:
			if (c == '\r' || c == '\n' || c == '&' || (!len))
			{
				if (!len)
					pbuf_insert_char(c);

				state = VAR_NAME;
				formdata[formdata_cnt++].field_value = pbuf_mkstr();
			}
			else
				pbuf_insert_char(c);
			break;
		}
	}
	formdata[formdata_cnt].field_name = NULL;
}

int
do_config_set(char *path, FILE *stream)
{
	int i;
	char * variable_name = NULL;
	char * variable_content = NULL;

	char* variable_url;

	variable_url = strrchr(path, '/');
	if (variable_url) variable_url++;

	for(i=0;i<sizeof(formdata)/sizeof(formdata[0]) && formdata[i].field_name; i++)
	{
		if(!strcmp(formdata[i].field_name, "variable"))
			variable_name = formdata[i].field_value;
		else if (!strcmp(formdata[i].field_name, "value"))
			variable_content = formdata[i].field_value;
	}

	fputs("{ \"status\": ", stream);
	if (variable_url && variable_name && variable_content && (!strcmp(variable_url, variable_name)))
	{
		if (nvram_set_variable(variable_name, variable_content))
		{
			fputs("\"ok\", \"value\" : \"", stream);
			fputs(variable_content, stream);
			fputs("\"}", stream);
		}
		else
			fputs("\"error-nvram-fail\"}", stream);
	}
	else
		fputs("\"error-unknown-variable\"}", stream);
	return 1;
}

int do_status_get(char *path, FILE *stream)
{
	fprintf(stream, "{\"config_cur\" : %d, \"config_max\" : %d, \"template_cur\" : %d, \"template_max\" : %d }",
			getNVRAMUsedBytes(NVRAM_CONFIG), getNVRAMSize(NVRAM_CONFIG),
			getNVRAMUsedBytes(NVRAM_TEMPLATE), getNVRAMSize(NVRAM_TEMPLATE));
	return 1;
}

int do_get_config_template(char *path, FILE *stream)
{
	int read_size;
	const char * data = readNVRAM(NVRAM_TEMPLATE, 0, &read_size);
	if (!data)
		return 0;

	fwrite(data, 1, getNVRAMUsedBytes(NVRAM_TEMPLATE), stream);
	return 1;
}

int cat_file(const char* file, FILE* stream)
{
	char buf[256];
	int len;
	FILE* f = fopen(file, "rb");
	if (!f)
		return 0;
	while(!feof(f))
	{
		len = fread(buf, 1, sizeof(buf), f);
		if (len)
			fwrite(buf, 1, sizeof(buf), stream);
		else
			break;
	}
	fclose(f);
	return 1;
}
int do_control_get(char *path, FILE *stream)
{
	char* control_id;
	control_id = strrchr(path, '/');
	if (!control_id)
		return 0;
	control_id++;

	if (!strcmp(control_id, "cat_messages"))
	{
		return cat_file("/var/log/messages", stream);
	}
	else if (!strcmp(control_id, "cat_free"))
	{
		return cat_file("/proc/meminfo", stream);
	}
	else if (!strcmp(control_id, "ps"))
	{

	}
	else
	{
		fputs("Unknown control message.", stream);
	}
	return 1;
}

void do_parse_fileupload(char *url, FILE *stream, int len, char *boundary)
{
	pbuf_clear();
	pbuf_ptr = len;
	fread(post_buf, 1, len, stream);
}

int verify_template_file(char* buf, int len)
{
	// Check ZIP file header.
	return ((int*)buf)[0] == 0x04034b50;
}

int do_upload_config_template(char *path, FILE *stream)
{
	if (verify_template_file(post_buf, pbuf_ptr) &&
		eraseNVRAM(NVRAM_TEMPLATE) &&
		writeNVRAM(NVRAM_TEMPLATE, post_buf, 0, pbuf_ptr))
		fputs("{success:true}", stream);
	else
		fputs("{success:false}", stream);

	return 1;
}

