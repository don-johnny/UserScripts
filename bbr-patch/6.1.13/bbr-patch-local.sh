#!/usr/bin/env bash

patch "$@" -i bbr-patch/bbrpatch-01-iul_inet_diag_h.patch
patch "$@" -i bbr-patch/bbrpatch-02-in_tcp_h.patch
patch "$@" -i bbr-patch/bbrpatch-03-il_tcp_h.patch
patch "$@" -i bbr-patch/bbrpatch-04-ni_tcp_rate_c.patch
patch "$@" -i bbr-patch/bbrpatch-05-ni_tcp_input_c.patch
patch "$@" -i bbr-patch/bbrpatch-06-inn_ipv4_h.patch
patch "$@" -i bbr-patch/bbrpatch-07-inl_snmp_h.patch
patch "$@" -i bbr-patch/bbrpatch-08-ni_proc_c.patch
patch "$@" -i bbr-patch/bbrpatch-09-ni_tcp_output_c.patch
patch "$@" -i bbr-patch/bbrpatch-10-il_tcp_skbuff_h.patch
patch "$@" -i bbr-patch/bbrpatch-11-in_tcp_inet_connection_sock_h.patch
patch "$@" -i bbr-patch/bbrpatch-12-ni_tcp_bbrplus_c.patch
patch "$@" -i bbr-patch/bbrpatch-13-ni_Kconfig.patch
patch "$@" -i bbr-patch/bbrpatch-14-ni_Makefile.patch
