#!/usr/bin/env bash

mkdir -p bbr-patch

curl -SfL -o bbr-patch/bbr-patch-local.sh "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbr-patch-local.sh"

# patch files
curl -SfL -o bbr-patch/bbrpatch-01-include-linux-tcp.h.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-01-include-linux-tcp.h.patch"
curl -SfL -o bbr-patch/bbrpatch-02-include-net-inet_connection_sock.h.patc      "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-02-include-net-inet_connection_sock.h.patc"
curl -SfL -o bbr-patch/bbrpatch-03-include-net-netns-ipv4.h.patch               "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-03-include-net-netns-ipv4.h.patch"
curl -SfL -o bbr-patch/bbrpatch-04-include-net-tcp.h.patch                      "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-04-include-net-tcp.h.patch"
curl -SfL -o bbr-patch/bbrpatch-05-include-uapi-linux-inet_diag.h.patch         "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-05-include-uapi-linux-inet_diag.h.patch"
curl -SfL -o bbr-patch/bbrpatch-06-include-uapi-linux-snmp.h.patch              "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-06-include-uapi-linux-snmp.h.patch"
curl -SfL -o bbr-patch/bbrpatch-07-net-ipv4-proc.c.patch                        "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-07-net-ipv4-proc.c.patch"
curl -SfL -o bbr-patch/bbrpatch-08-net-ipv4-sysctl_net_ipv4.c.patch             "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-08-net-ipv4-sysctl_net_ipv4.c.patch"
curl -SfL -o bbr-patch/bbrpatch-09-net-ipv4-tcp.c.patch                         "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-09-net-ipv4-tcp.c.patch"
curl -SfL -o bbr-patch/bbrpatch-10-net-ipv4-tcp_cong.c.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-10-net-ipv4-tcp_cong.c.patch"
curl -SfL -o bbr-patch/bbrpatch-11-net-ipv4-tcp_input.c.patch                   "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-11-net-ipv4-tcp_input.c.patch"
curl -SfL -o bbr-patch/bbrpatch-12-net-ipv4-tcp_ipv4.c.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-12-net-ipv4-tcp_ipv4.c.patch"
curl -SfL -o bbr-patch/bbrpatch-13-net-ipv4-tcp_output.c.patch                  "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-13-net-ipv4-tcp_output.c.patch"
curl -SfL -o bbr-patch/bbrpatch-14-net-ipv4-tcp_rate.c.patch                    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-14-net-ipv4-tcp_rate.c.patch"
curl -SfL -o bbr-patch/bbrpatch-15-net-ipv4-tcp_timer.c.patch                   "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-15-net-ipv4-tcp_timer.c.patch"
curl -SfL -o bbr-patch/bbrpatch-16-include-linux-skbuff.h.patch                 "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-16-include-linux-skbuff.h.patch"
curl -SfL -o bbr-patch/bbrpatch-17-net-ipv4-Kconfig.patch                       "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-17-net-ipv4-Kconfig.patch"
curl -SfL -o bbr-patch/bbrpatch-18-net-ipv4-Makefile.patch                      "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-18-net-ipv4-Makefile.patch"
curl -SfL -o bbr-patch/bbrpatch-19-net-ipv4-tcp_bbrplus.c.patch                 "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/bbrpatch-19-net-ipv4-tcp_bbrplus.c.patch"

# bbrplus file
cp -v net/ipv4/tcp_bbr{,plus}.c

# bbr2 sources files
curl -SfL -o net/ipv4/tcp_bbr2.c   "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/tcp_bbr2.c"
curl -SfL -o net/ipv4/tcp_plb.c    "https://raw.githubusercontent.com/tinkernels/userscripts/gh-pages/bbr-patch/6.1.13/tcp_plb.c"

# run local patch script

chmod a+x bbr-patch/bbr-patch-local.sh

bbr-patch/bbr-patch-local.sh -p1 --verbose