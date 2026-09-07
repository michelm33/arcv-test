#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: install_arcv-test.sh
# Release file date: 2026-09-06 23:46
# App version: 1.2.1
# App source revision: 239
# App source signature: 73f3ec4cf9055d6eb78ae7ed07fc259d1c9cecf2ff1bdf70ecf5f69b51b4ee1f
# Source file last modification: 2026-09-03 19:01:12.442603546 +0200
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

shotplan_version=1.1-1
shellapi_version=1.1-3
arcv_version=1.2-1
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
