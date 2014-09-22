#!/bin/sh

# learn to use getopt & getopts
# 2014年 09月 22日 星期一 22:09:10 CST
#
# for c getopt
# "vha"	no need OPTARG
# "m:"	   need mX
# "m::"	   need m X

while getopts m:vhak:: opt
do
	echo " @: $@"
	case ${opt} in
		h) 
			echo "arg: ${OPTARG}"
			bash --help
			;;
		v)
			echo "arg: ${OPTARG}"
			echo "open view. ^.^"
			;;
		a)
			echo "arg: ${OPTARG}"
			echo "open all option"
			bash --help
			echo "open view. ^.^"
			;;
		m)
			echo "open option m"
			echo "arg: ${OPTARG}"
			;;
		k)
			echo "arg: ${OPTARG}"
			echo "open option k"
			;;
		*)
			echo "not known option!"
			;;
	esac
	echo " optind: ${OPTIND} "
done
echo " optind: ${OPTIND} "

shift `expr ${OPTIND} - 1`
echo "@: $@"

