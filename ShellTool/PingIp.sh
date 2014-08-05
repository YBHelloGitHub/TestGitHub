#!/bin/sh
#
# Description: ping x.x.x.x
#
# 2014年 08月 05日 星期二 23:20:27 CST

ip_base="192.168.1"
for ip_tail in $(seq 2 254)
do
	# -c count		: ping的次数
	# -w dealline	: ping等待的时间
	ping -c 1 -w 1 ${ip_base}.${ip_tail} > /dev/null 2> /dev/null && \
		echo "${ip_base}.${ip_tail} is up" || echo "${ip_tail}"
done

