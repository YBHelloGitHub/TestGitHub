/*
 * file: 1_1.c
 * desc: a mini 'ls' command
 * date: 2014年 09月 21日 星期日 11:16:40 CST
 */
#include <dirent.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

int list_dir(const char * dir_name);

int main(int argc, char **argv)
{
	int			 i = 0;

	if ( 1 == argc ) {
		return (list_dir("."));

	}

	for (i = 0; i < argc - 1; i++) {
		fprintf(stdout, "\n%s:\n", argv[i + 1]);
		list_dir(argv[i + 1]);
	}

	return 0;
}


/*
 * name: list_dir
 * func: list @dir_name file
 * return: fail -- EXIT_FAILURE; success -- EXIT_SUCCESS
 */
#include <errno.h>
#include <string.h>
#include <unistd.h>

#define MAX_MSG_LEN		(256)

extern int errno;

int list_dir(const char * dir_name)
{
	DIR				*dir = NULL;
	char			 msg[MAX_MSG_LEN] = {0};
	struct dirent	*dirent = NULL;

	if (NULL == dir_name) {
		return EXIT_FAILURE;
	}

	dir = opendir(dir_name);
	if (NULL == dir) {
		snprintf(msg, MAX_MSG_LEN, "open %s: %s\n", dir_name, strerror(errno));
		msg[MAX_MSG_LEN - 1] = '\0';
		fprintf(stderr, "%s", msg);
		return EXIT_FAILURE;
	}

	while (NULL != (dirent = readdir(dir))) {
		fprintf(stdout, "%s\t", dirent->d_name);
	}
	putchar('\n');
	closedir(dir);

	return EXIT_SUCCESS;
}

