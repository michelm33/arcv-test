#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: install_arcv-test.sh
# Release file date: 2026-10-25 20:13
# App version: 2.0.0
# App source revision: 270
# App source signature: d027990262239a4dfb376e7f2438af668e9c5274dc47c401dbbe26dbbe7a2c2a
# Source file last modification: 2026-10-24 12:50:31.262845740 +0200
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

shotplan_version=1.1-3
shellapi_version=1.2-0
arcv_version=2.0-0
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
