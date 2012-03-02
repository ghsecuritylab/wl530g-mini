/*****************************************************************************
 * Copyright (C) 2004 Katalix Systems Ltd
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 *
 *****************************************************************************/

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

#include "usl.h"
#include "../l2tp_private.h"

int usl_debug;
void (*usl_log_fn)(int level, const char *fmt, ...) = syslog;

/* The proper way to make ourself a daemon.
 */
#ifdef WX54G
void usl_daemonize(char *prog)
#else
void usl_daemonize(void)
#endif
{
#ifdef WX54G
		pid_t pid;
		int _argc;
		char *_argv[3];

		pid = vfork();

		if (pid < 0)	{
			exit (1);
		} else if (pid > 0)	{
			exit (0);
		}

		// child process
		_argc = 0;
		_argv[_argc++] = prog;
		_argv[_argc++] = "-c";
		_argv[_argc++] = NULL;
		execv ("/sbin/openl2tpd", _argv);
		// not reached
		fprintf (stderr, "Counldn't exec\n");
		_exit (1);
#else
        pid_t pid;

        pid = fork();
        if (pid < 0) 
		{
			exit(1);         /* for failed */
		}
        if (pid > 0) _exit(0);        /* parent exits */

        setsid();

        pid = fork();
        if (pid < 0) 
		{
			exit(1);         /* for failed */
		}
        if (pid > 0) _exit(0);        /* parent exits */

        chdir("/");

        freopen("/dev/null", "r", stdin);
        freopen("/dev/null", "w", stdout);
        freopen("/dev/null", "w", stderr);
#endif
}

/* Allows an app to register the function to be called to log debug
 * messages. syslog() is used by default.
 */
void usl_set_debug(int debug, void (*log_fn)(int level, const char *fmt, ...))
{
        usl_debug = debug;
        usl_log_fn = log_fn;
}
