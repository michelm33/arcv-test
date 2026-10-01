#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: update_vernum_in_files.sh
# Release file date: 2026-09-30 20:43
# App version: 1.2.2
# App source revision: 247
# App source signature: a0bcc8a89f613120ab2de8c2f0e4d2dc84027ca6bd2bc746b92ae5e8ba99df97
# Source file last modification: 2026-09-30 19:34:21.886883775 +0200
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
DIRNAME="${BASH_SOURCE[0]%/*}"
MYDIR="$(readlink -f "${DIRNAME}")"

# Script works fine only if versions of arcv, arcv-test 
#  shellapi and shotplan change all together.
# If this is not the case, the variables may be originally hardcoded
# here. If the var is defined, the matching VERSION.txt won't be read

#SHOTPLAN_VERSION=1.1-1

if [ ! -v ARCV_TEST_VERSION ] ; then
    ARCV_TEST_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/VERSION.txt")"
fi
if [ ! -v ARCV_VERSION ] ; then
    ARCV_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/../arcv/VERSION.txt")"
fi
if [ ! -v SHELLAPI_VERSION ] ; then
    SHELLAPI_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/shell-api/VERSION.txt")"
fi
if [ ! -v SHOTPLAN_VERSION ] ; then
    SHOTPLAN_VERSION="$(awk -F'.' '{ printf("%s.%s-%s" ,$1,$2,$3);}' "${MYDIR}/../shotplan/VERSION.txt")"
fi

#
# Update version nums in install script
#

processedFile="${MYDIR}/install_arcv-test.sh"

tmpf=$(mktemp)
cat "${processedFile}" | awk -F"=" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
-v SHOTPLAN_VERSION=${SHOTPLAN_VERSION} \
'
{ 
    if (NF == 2) 
    {
        if ($1 == "shellapi_version") {
            print "shellapi_version" "=" SHELLAPI_VERSION
        } else if ($1 == "arcv_version") {
            print "arcv_version" "=" ARCV_VERSION
        } else if ($1 == "shotplan_version") {
            print "shotplan_version" "=" SHOTPLAN_VERSION
        } else {
            print $0
        }
    }
    else
    {
        print $0
    }
}
' > "$tmpf"

#cat "$tmpf" # DEBUG
diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
    chmod +x "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi

#
# Update version nums in pack/debian/control
#

processedFile="${MYDIR}/pack/debian/control"

tmpf=$(mktemp)
cat "${processedFile}" | awk -F":" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
-v SHOTPLAN_VERSION=${SHOTPLAN_VERSION} \
'
{ 
    if ($1 == "Depends") {
        print $1 ":" " ${shlibs:Depends}, ${misc:Depends}, " "arcv (=" ARCV_VERSION "), " "shell-api (=" SHELLAPI_VERSION "), shotplan (=" SHOTPLAN_VERSION ")"
    } else {
        print $0
    }
}
' > "$tmpf"

#cat "$tmpf" # DEBUG

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi


#
# Update version nums in online doc
#

processedFile="/home/michel/riffian/Data/Documents/professionnel/SlashEtc/siteweb/developertoolsforlinux/pages/_topics/arcv/arcv_version.adoc"
tmpf=$(mktemp)
cat "${processedFile}" | awk -F":" \
-v ARCV_VERSION=${ARCV_VERSION} \
-v SHELLAPI_VERSION=${SHELLAPI_VERSION} \
-v SHOTPLAN_VERSION=${SHOTPLAN_VERSION} \
'
{ 
    if ($2 == "shellapi_version") {
        print ":" "shellapi_version" ": " SHELLAPI_VERSION
    } else if ($2 == "arcv_version") {
        print ":" "arcv_version" ": " ARCV_VERSION
    } else if ($2 == "shotplan_version") {
        print ":" "shotplan_version" ": " SHOTPLAN_VERSION
    } else {
        print $0
    }
}
' > "$tmpf"

#cat "$tmpf" # DEBUG

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi


#
# Update version nums in readme.asciidoc
# dummy example:
#    'arcv-test_1.0-0' => 'arcv-test_1.0-1'
#    'shotplan_1.0-0' => 'shotplan_1.0-1'
#

processedFile="${MYDIR}/README.asciidoc"
tmpf=$(mktemp)
cat "${processedFile}" \
| sed -E "s/arcv-test_[0-9]+\.[0-9]+\-[0-9]+/arcv-test_${ARCV_TEST_VERSION}/g" \
| sed -E "s/shotplan_[0-9]+\.[0-9]+\-[0-9]+/shotplan_${SHOTPLAN_VERSION}/g" \
> "$tmpf"

#cat "$tmpf" # DEBUG

diff "$tmpf" "${processedFile}" &>/dev/null
if [ $? -ne 0 ] ; then
    echo "Updating $processedFile"
    mv "$tmpf" "$processedFile"
else 
    echo "No change for $processedFile"
    rm "$tmpf"
fi

