#!/usr/bin/env bash

set -e

patch "$@" -i   bbr-patch/bbrpatch-01-include-linux-tcp.h.patch
patch "$@" -i   bbr-patch/bbrpatch-02-include-net-inet_connection_sock.h.patc
patch "$@" -i   bbr-patch/bbrpatch-03-include-net-netns-ipv4.h.patch
patch "$@" -i   bbr-patch/bbrpatch-04-include-net-tcp.h.patch
patch "$@" -i   bbr-patch/bbrpatch-05-include-uapi-linux-inet_diag.h.patch
patch "$@" -i   bbr-patch/bbrpatch-06-include-uapi-linux-snmp.h.patch
patch "$@" -i   bbr-patch/bbrpatch-07-net-ipv4-proc.c.patch
patch "$@" -i   bbr-patch/bbrpatch-08-net-ipv4-sysctl_net_ipv4.c.patch
patch "$@" -i   bbr-patch/bbrpatch-09-net-ipv4-tcp.c.patch
patch "$@" -i   bbr-patch/bbrpatch-10-net-ipv4-tcp_cong.c.patch
patch "$@" -i   bbr-patch/bbrpatch-11-net-ipv4-tcp_input.c.patch
patch "$@" -i   bbr-patch/bbrpatch-12-net-ipv4-tcp_ipv4.c.patch
patch "$@" -i   bbr-patch/bbrpatch-13-net-ipv4-tcp_output.c.patch
patch "$@" -i   bbr-patch/bbrpatch-14-net-ipv4-tcp_rate.c.patch
patch "$@" -i   bbr-patch/bbrpatch-15-net-ipv4-tcp_timer.c.patch
patch "$@" -i   bbr-patch/bbrpatch-16-include-linux-skbuff.h.patch
patch "$@" -i   bbr-patch/bbrpatch-17-net-ipv4-Kconfig.patch
patch "$@" -i   bbr-patch/bbrpatch-18-net-ipv4-Makefile.patch
patch "$@" -i   bbr-patch/bbrpatch-19-net-ipv4-tcp_bbrplus.c.patch