#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: arcv-test__help.sh
# Release file date: 2026-07-23 15:46
# App version: 1.0.0
# App source revision: 145
# App source signature: 116201585e582dd90c97262a28219baec90914d196015114cd40a8fac9612ba5
# Source file last modification: 2026-07-22 17:05:13.053671818 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This file contains the definition of all help functions
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

Arcv-test__version() {

  local verfile="${ARCV_TEST__VARS["MYDIR"]}/VERSION.txt"
  local revfile="${ARCV_TEST__VARS["MYDIR"]}/REVISION.txt"
  local copyright="${ARCV_TEST__VARS["MYDIR"]}/COPYRIGHT.txt"

  # Version info
  # Version file contains one line giving the version x.y.z
  echo -n "${__SHELL_CURRENT_APPNAME__} "
  if [ -f "${verfile}" ] ;  then
    cat "${verfile}"
  else
    echo "?.?.?"
  fi
  
  # Revision info if any
  # Revision file contains 2 lines
  # Line 1: the revision number in the configuration management system
  # Line 2: a signature like a hash code computed over the source files 
  if [ -f "${revfile}" ] ;  then
    echo -n "Revision "
    local line
    local cnt=0
    while IFS=''  read -r line
    do
      if [ $cnt -eq 0 ] ; then
        echo -n "$line"
      elif [ $cnt -eq 1 ] ; then
        echo -n " signed $line"
      fi
      cnt=$(($cnt + 1))
    done < <(cat "${revfile}")

    if [ $cnt -eq 1 ] ; then
          echo -n " (unsigned)"
    fi    
    echo
  fi

  # Copyright
  # The trailing line from 4th line are displayed
  if [ -f "${copyright}" ] ;  then
    echo
    local content="$(cat "${copyright}")"
    echo "${content}"|tail -n+3
  fi

  # Author
  # Author fullname is retrieved from passwd
  local fnUser=""
  User__getFullUserName fnUser
cat<<EOF

Written by ${fnUser}

EOF
}

Arcv-test__revision() {
  local revfile="${ARCV_TEST__VARS["MYDIR"]}/REVISION.txt"

  # Revision info if any
  if [ -f "${revfile}" ] ;  then
    local line
    local __lcnt=0
    local revisionnum=""
    while IFS=''  read -r line
    do
      if [ ${__lcnt} -eq 0 ] ; then
        revisionnum="$line"
        break
      fi
      __lcnt=$((${__lcnt} + 1))
    done < <(cat "${revfile}")

    if [ -z "$revisionnum" ] ; then
      echo "?"
    else
      echo "$revisionnum"
    fi
  else
    echo "?"
  fi
}

Arcv-test__hash() {
  local revfile="${ARCV_TEST__VARS["MYDIR"]}/REVISION.txt"

  # Revision info if any
  if [ -f "${revfile}" ] ;  then
    local line
    local __lcnt=0
    local hashcode=""
    while IFS=''  read -r line
    do
      if [ ${__lcnt} -eq 1 ] ; then
        hashcode="$line"
        break
      fi
      __lcnt=$((${__lcnt} + 1))
    done < <(cat "${revfile}")

    if [ -z "$hashcode" ] ; then
      echo "?"
    else
      echo "$hashcode"
    fi
  else
    echo "?"
  fi
}

Arcv-test__versionnum() {
  local vfile="${ARCV_TEST__VARS["MYDIR"]}/VERSION.txt"
  if [ -f "$vfile" ] ; then
cat << EOF
$(cat "$vfile")
EOF
  else
    echo "?"
  fi
}

:<<'EOF'
Help display callback (-h) for usage
EOF

Arcv-test__help() {
  echo
  Arcv-test__usage
  Arcv-test__help_nousage  
  Arcv-test__examples
  echo
  echo "Report bugs to <michel.mehl@slashetc.fr>"

}

Arcv-test__help_nousage() {
cat << EOF

$(basename $0) is wrapper for the  'shotplan' test tool which is used to run tests according to a plan file located in \${ARCV_TEST_DIR}/shotplan.yml 

Actually, it calls another wrapper 'test_arcv' before shotplan is actually invoked. 

All arguments passed on to this script are eventually forwarded to shotplan via test_arcv.

When testing a release, the symlink /usr/bin/shotplan to the source folder of shotplan must exist (there's no installable package yet for shotplan). Example:  sudo ln -s \$HOME/riffian/Data/Data/admin/linux/shotplan /usr/bin/shotplan   

This script shall not be used when running tests in the docker container instead test_arcv shalll be called directly without reporting (-T).

arcv-test is the top-level wrapper for the following purposes:
- It provides usually API for a shell api app 
- arcv-test handles the ARCV_DIR and ARCV_TEST_DIR variables depending whether ARCV_DIR is set to or not, determines whether a release is tested or a dev version, setting the variable properly when no.
- In case of release testing, it runs install_arcv-test.sh to install all necessary packages
- provides the default options for running shotplan: --force-defaults -C all -y -i
- iIt opens a separate terminal at the left of the desktop in which will be run test_arcv

test_arcv is a low-level wrapper script for the sake of :
- Depending on the value of ARCV_TEST_DIR, setting ARCV_DIR accordingly
- Running shotplan with the suitable plan file path.
- Enabling to run shotplan with free arguments for other purposes, like extracting data from the plan by passing suitable arguments.
- Running the tests inside docker
- It redirects in a file "test-report-arcv-<arcv version>-<arcv revision>-<date time>" the output of the test running, which can be viewed using cat <file>|more

EOF

}

:<<'EOF'
Short usage display callback without the option details
EOF

Arcv-test__susage_without_options() {
  local __cmdbasename="$(basename $0)"
cat << EOF
Usage: ${__cmdbasename} OPTIONS 
or: ${__cmdbasename} OPTIONS 
EOF
}

:<<'EOF'
Usage display callback 
EOF

Arcv-test__susage() {

  local ctrlFlag=""
  if [ $# -gt 0 ] ; then
    ctrlFlag="$1"
  fi

cat << EOF
$(Arcv-test__susage_without_options)

OPTIONS:

$(_soptions ARCV_TEST__OPTION_LIST_DESC ARCV_TEST__OPTION_LIST_SDESC ARCV_TEST__OPTION_LIST_ARGS ARCV_TEST__OPTION_LIST_ARGS_TYPE ARCV_TEST__OPTION_LIST_INTERN "" $ctrlFlag)

EOF
}

Arcv-test__usage_args() {
cat << EOF

Arguments:

 <sample arg>       put your argument short description here. Copy/paste in new line and change for additional ones.

EOF
}

:<<'EOF'
Usage display callback 
EOF

Arcv-test__usage() {
cat << EOF
$(Arcv-test__susage)
$(Arcv-test__usage_args)

EOF
}

Arcv-test__examples() {
  local exampleFile="${ARCV_TEST__VARS["MYDIR"]}/EXAMPLES.txt"
  if [ -f "${exampleFile}" ] ; then
    cat "${exampleFile}"
  fi
}

#$(Arcv-test__usage_args)
Arcv-test__man() {
cat << EOF | less
*SYNOPSIS*

$(Arcv-test__susage_without_options)


OPTIONS:

SHOTPLAN OPTIONS
          see shotplan -h

$(_soptions ARCV_TEST__OPTION_LIST_DESC ARCV_TEST__OPTION_LIST_SDESC ARCV_TEST__OPTION_LIST_ARGS ARCV_TEST__OPTION_LIST_ARGS_TYPE ARCV_TEST__OPTION_LIST_INTERN "" "man")

*DESCRIPTION*

$(Arcv-test__help_nousage)

*EXAMPLES*

$(Arcv-test__examples)

Report bugs to <michel.mehl@slashetc.fr>

EOF
}

