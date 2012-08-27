#!/bin/bash
# - title        : Hyperic Startup INIT script
# - description  : This script will allow you to start Hyperic on Boot
# - author       : Kevin Carter
# - License      : GPLv3
# - date         : 2012-01-26
# - version      : 2.0
# - usage        : bash hypericserver
# - bash_version : >= 3.2.48(1)-release
# - Notes -------------------------------------------------------- ###
### This script was created by Kevin Carter and BK Integration     ###
### This script is for use under GPL and you should feel free to   ###
### Modify it as you see fit, all I ask is that you give me credit ###
### for some of it...  I hope these files help, Drop me a line and ###
### let me know.  http://rackerua.com                              ###
### -------------------------------------------------------------- ###

### -------------------------------------------------------------- ###
### The scope of this script is to allow you the administrator the ###
### Ability to start and stop Hyperic Server based on the restart  ###
### Of the Physical Server.                                        ###
### -------------------------------------------------------------- ###

### -------------------------------------------------------------- ###
### CHANGE ONLY THE INFORMATION AFTER THE = SIGN                   ###
### THE NAME OF THE USB HARD DRIVE NEEDS TO GO                     ###
### DIRECTLY AFTER THE = SIGN                                      ###
### -------------------------------------------------------------- ###


# What is the Name of this Script, and what are we starting
PROGRAM="Hyperic Server"

# What is the Directory to your server installation of HYPERIC
AGENT_DIR=/home/hyperic/server-4.5.1/bin/

# Enter the User name for the USER that will Start and Stop HYPERIC
# THIS CANNOT BE ROOT
USER=REPLACE-THIS-USER


### -------------------------------------------------------------- ###
###    DO NOT EDIT THIS AREA UNLESS YOU KNOW WHAT YOU ARE DOING    ###
### -------------------------------------------------------------- ###
# export HQ_JAVA_HOME=/opt/bea/jrockit81sp1_141_03
case "$1" in
start)
su - $USER -c "$AGENT_DIR/hq-server.sh start"
echo $PROGRAM is Initializing... 
;;
stop)
su - $USER -c "$AGENT_DIR/hq-server.sh stop"
echo $PROGRAM is Shutting Down...
;;
restart)
su - $USER -c "$AGENT_DIR/hq-server.sh restart"
echo $PROGRAM is Restarting...
;;
status)
su - $USER -c "$AGENT_DIR/hq-server.sh status"
;;
dump)
su - $USER -c "$AGENT_DIR/hq-server.sh dump"
;;
*)
echo "Usage: $0 {start|stop|restart|status|dump}" >&2
exit 1
;;
esac



