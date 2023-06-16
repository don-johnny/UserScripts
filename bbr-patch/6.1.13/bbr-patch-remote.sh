#!/usr/bin/env bash

mkdir -p bbr-patch

curl -sSfL -o bbr-patch/bbr-patch-local.sh "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbr-patch-local.sh"

# patch files
curl -sSfL -o bbr-patch/bbrpatch-01-iul_inet_diag_h.patch               "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-01-iul_inet_diag_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-02-in_tcp_h.patch                      "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-02-in_tcp_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-03-il_tcp_h.patch                      "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-03-il_tcp_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-04-ni_tcp_rate_c.patch                 "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-04-ni_tcp_rate_c.patch"
curl -sSfL -o bbr-patch/bbrpatch-05-ni_tcp_input_c.patch                "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-05-ni_tcp_input_c.patch"
curl -sSfL -o bbr-patch/bbrpatch-06-inn_ipv4_h.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-06-inn_ipv4_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-07-inl_snmp_h.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-07-inl_snmp_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-08-ni_proc_c.patch                     "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-08-ni_proc_c.patch"
curl -sSfL -o bbr-patch/bbrpatch-09-ni_tcp_output_c.patch               "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-09-ni_tcp_output_c.patch"
curl -sSfL -o bbr-patch/bbrpatch-10-il_tcp_skbuff_h.patch               "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-10-il_tcp_skbuff_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-11-in_tcp_inet_connection_sock_h.patch "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-11-in_tcp_inet_connection_sock_h.patch"
curl -sSfL -o bbr-patch/bbrpatch-12-ni_tcp_bbrplus_c.patch              "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-12-ni_tcp_bbrplus_c.patch"
curl -sSfL -o bbr-patch/bbrpatch-13-ni_Kconfig.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-13-ni_Kconfig.patch"
curl -sSfL -o bbr-patch/bbrpatch-14-ni_Makefile.patch                   "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-14-ni_Makefile.patch"

# bbr2 sources files
curl -sSfL -o net/ipv4/tcp_bbr2.c   "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/tcp_bbr2.c"
curl -sSfL -o net/ipv4/tcp_plb.c    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/tcp_plb.c"

# run local patch script

chmod a+x bbr-patch/bbr-patch-local.sh

bbr-patch/bbr-patch-local.sh -p1