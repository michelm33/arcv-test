#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: filter-sourcelist.sh
# Release file date: 2026-10-25 20:13
# App version: 2.0.0
# App source revision: 270
# App source signature: d027990262239a4dfb376e7f2438af668e9c5274dc47c401dbbe26dbbe7a2c2a
# Source file last modification: 2026-10-13 18:37:58.907848975 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This script is used to only extract the revision number of a source folder
# in the repository using the 'list' command thus not requiring a source image
# As argument the source folder name shall be passed
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

grep -F "$1"|awk '{print $2}'
