#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: arcv-test__options.sh
# Release file date: 2026-08-28 16:47
# App version: 1.2.0
# App source revision: 225
# App source signature: 47bbb515454a026c9e029bdb513674d7303f5c05bc1833e8c50bf60e97ebc29c
# Source file last modification: 2026-08-25 12:07:24.414741364 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
# This file contains the definition of all options supported by Arcv-test.
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

# Keys are option alternatives separated by |
declare -A ARCV_TEST__OPTION_LIST_SDESC # Option short description 
declare -A ARCV_TEST__OPTION_LIST_DESC # Option description
declare -A ARCV_TEST__OPTION_LIST_ARGS # Tells whether arg expected or none
declare -A ARCV_TEST__OPTION_LIST_ARGS_TYPE # Give the type of the argument(s)
declare -A ARCV_TEST__OPTION_LIST_VALS # Executed code when processing an expected arg
declare -A ARCV_TEST__OPTION_LIST_ACTI # Executed code when option is detected
declare -A ARCV_TEST__OPTION_LIST_INTERN # Tells whether the option is not intended for end-users or only for advanced ones

:<<'EOF'
-h, -v, --man are standard options
EOF

ARCV_TEST__OPTION_LIST_SDESC["--help|-h"]="Displays app usage"
ARCV_TEST__OPTION_LIST_DESC["--help|-h"]="
Displays app usage
"
ARCV_TEST__OPTION_LIST_ARGS["--help|-h"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--help|-h"]=''

ARCV_TEST__OPTION_LIST_SDESC["--man"]="Displays the manual page"
ARCV_TEST__OPTION_LIST_DESC["--man"]="
Displays the manual page. The output can be used to generate regular MAN PAGES
"
ARCV_TEST__OPTION_LIST_ARGS["--man"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--man"]=''


ARCV_TEST__OPTION_LIST_SDESC["-v|--version"]="Displays the app version"
ARCV_TEST__OPTION_LIST_DESC["-v|--version"]="
Displays the app version. The output can be used to generate regular debian packages
"
ARCV_TEST__OPTION_LIST_ARGS["-v|--version"]="1"
ARCV_TEST__OPTION_LIST_ACTI["-v|--version"]=''


:<<'EOF'
-y, -n, -v are additional options defined for convenience
EOF

ARCV_TEST__OPTION_LIST_SDESC["-y"]="Assume 'Yes' when prompted for confirmation"
ARCV_TEST__OPTION_LIST_DESC["-y"]="
Assume 'Yes' answer for any confirmation request
"
ARCV_TEST__OPTION_LIST_ARGS["-y"]="1"
ARCV_TEST__OPTION_LIST_ACTI["-y"]='Input__pushForcedInput "y"'


ARCV_TEST__OPTION_LIST_SDESC["-n"]="Assume 'No' when prompted for confirmation"
ARCV_TEST__OPTION_LIST_DESC["-n"]="
Assume 'No' answer for any confirmation request
"
ARCV_TEST__OPTION_LIST_ARGS["-n"]="1"
ARCV_TEST__OPTION_LIST_ACTI["-n"]='Input__pushForcedInput "y"'


ARCV_TEST__OPTION_LIST_SDESC["--verbose"]="Verbose mode"
ARCV_TEST__OPTION_LIST_DESC["--verbose"]="
Verbose mode. Shows messages additionally to those usually displayed.
"
ARCV_TEST__OPTION_LIST_ARGS["--verbose"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--verbose"]='ARCV_TEST__VARS["verbose"]=true'


ARCV_TEST__OPTION_LIST_SDESC["--silent"]="Silent mode"
ARCV_TEST__OPTION_LIST_DESC["--silent"]="
Silent mode. Hides messages which are usually displayed even when verbose mode is not active.
"
ARCV_TEST__OPTION_LIST_ARGS["--silent"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--silent"]='ARCV_TEST__VARS["silent"]=true'


ARCV_TEST__OPTION_LIST_SDESC["--debug"]="Activate debug logs"
ARCV_TEST__OPTION_LIST_DESC["--debug"]="
Activate debug logs
"
ARCV_TEST__OPTION_LIST_ARGS["--debug"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--debug"]='__LOG_DEBUG__=0'


ARCV_TEST__OPTION_LIST_SDESC["--files"]="Lists all the files used by the app (config, log etc)"
ARCV_TEST__OPTION_LIST_DESC["--files"]="
Lists the files used by the app, i.e. the configuration file, the log file, the dependency system package installation cache file
"
ARCV_TEST__OPTION_LIST_ARGS["--files"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--files"]='
local file
if _getConfigFilePath file ; then
        echo "${file}"
fi

if _getLogPath file ; then
        echo "${file}"
fi

if _getDependenciesCacheFile file ; then
        echo "${file}"
fi

_quit ""
'

ARCV_TEST__OPTION_LIST_SDESC["--log"]="Show the log tail"
ARCV_TEST__OPTION_LIST_DESC["--log"]="
Show the log tail. By default, shows the last 40 lines and the number of lines specified as option value.
"
ARCV_TEST__OPTION_LIST_ARGS["--log"]="2"
ARCV_TEST__OPTION_LIST_ACTI["--log"]='
local __log
_getLogPath __log
tail -F "${__log}" -n 40
_quit ""
'
ARCV_TEST__OPTION_LIST_VALS["--log"]='
local __log
_getLogPath __log
tail -F "${__log}" -n "${__myarg}"
_quit ""
'

ARCV_TEST__OPTION_LIST_SDESC["--config"]="Show the configuration file content"
ARCV_TEST__OPTION_LIST_DESC["--config"]="
Shows the configuration file content
"
ARCV_TEST__OPTION_LIST_ARGS["--config"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--config"]='
local file
if _getConfigFilePath file ; then
        echo "${file}:"
        cat "${file}"
        echo "END"
        _quit ""
else
        _exit -1 "Failed to retrieve configuration file path"

fi 
'


ARCV_TEST__OPTION_LIST_SDESC["--C"]="Start the test container and install packages without running"
ARCV_TEST__OPTION_LIST_DESC["--C"]="
Starts the test container
"
ARCV_TEST__OPTION_LIST_ARGS["--C"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--C"]='
ARCV_TEST__VARS["container"]=true
'

ARCV_TEST__OPTION_LIST_SDESC["--Cd"]="Start the test container in debug mode with app pointing to the development versions"
ARCV_TEST__OPTION_LIST_DESC["--Cd"]="
Starts the test container
"
ARCV_TEST__OPTION_LIST_ARGS["--Cd"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--Cd"]='
ARCV_TEST__VARS["container"]=true
ARCV_TEST__VARS["container-debug"]=true
'

ARCV_TEST__OPTION_LIST_SDESC["--CA"]="Start the test container, install packages and run the test automatically"
ARCV_TEST__OPTION_LIST_DESC["--CA"]="
Starts the test container
"
ARCV_TEST__OPTION_LIST_ARGS["--CA"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--CA"]='
ARCV_TEST__VARS["runcontainertest"]=true
'

ARCV_TEST__OPTION_LIST_SDESC["--CC"]="Start and open a shell in the test container"
ARCV_TEST__OPTION_LIST_DESC["--CC"]="
Starts and opens a shell in the test container
"
ARCV_TEST__OPTION_LIST_ARGS["--CC"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--CC"]='
ARCV_TEST__VARS["opencontainerconsole"]=true
'

ARCV_TEST__OPTION_LIST_SDESC["--CU"]="Updates the dock-install-app script of the container"
ARCV_TEST__OPTION_LIST_DESC["--CU"]="
Starts the test container
"
ARCV_TEST__OPTION_LIST_ARGS["--CU"]="1"
ARCV_TEST__OPTION_LIST_ACTI["--CU"]='
ARCV_TEST__VARS["updatedockinstallscript"]=true
'
