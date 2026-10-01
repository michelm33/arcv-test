#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: install_arcv-test.sh
# Release file date: 2026-09-30 20:43
# App version: 1.2.2
# App source revision: 247
# App source signature: a0bcc8a89f613120ab2de8c2f0e4d2dc84027ca6bd2bc746b92ae5e8ba99df97
# Source file last modification: 2026-09-30 19:34:47.404824986 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
#
# ------------------------------------------------------------------------------
# 
# Report bugs and suggestions: 
#     assistance@slashetc.fr
# 
# Specific or corporate requirements or extensions: 
#     info@slashetc.fr
# 
# The author is overall not required to provide maintenance or support 
# outside specific commercial terms agreed.
# 
###############################################################################

shotplan_version=1.1-2
shellapi_version=1.1-4
arcv_version=1.2-2
baseurl="https://slashetc.fr/download"
arcv_pkg="arcv_${arcv_version}_amd64.deb"
arcvtest_pkg="arcv-test_${arcv_version}_amd64.deb"
shellapi_pkg="shell-api_${shellapi_version}_amd64.deb"
shotplan_pkg="shotplan_${shotplan_version}_amd64.deb"

if  ! dpkg-query -l wget &>/dev/null || [ $(dpkg-query -W -f='${db:Status-Abbrev}' wget) != "ii" ]  ; then
    apt-get install -y wget
fi

wget "${baseurl}/${shellapi_pkg}" && sudo dpkg -i "${shellapi_pkg}" && rm "${shellapi_pkg}" || echo "Installation of shell-api failed"

wget "${baseurl}/${arcv_pkg}" && sudo dpkg -i "${arcv_pkg}" && rm "${arcv_pkg}" || echo "Installation of arcv failed"

wget "${baseurl}/${shotplan_pkg}" && sudo dpkg -i "${shotplan_pkg}" && rm "${shotplan_pkg}" || echo "Installation of shotplan failed"

wget "${baseurl}/${arcvtest_pkg}" && sudo dpkg -i "${arcvtest_pkg}" && rm "${arcvtest_pkg}" || echo "Installation of arcv failed"
