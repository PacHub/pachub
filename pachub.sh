#!/bin/bash

#########################################################
#	    ____                    __  __            __	#
#	   / __ \  ____ _  _____   / / / /  __  __   / /_ 	#
#	  / /_/ / / __ `/ / ___/  / /_/ /  / / / /  / __ \	#
#	 / ____/ / /_/ / / /__   / __  /  / /_/ /  / /_/ /	#
#	/_/      \__,_/  \___/  /_/ /_/   \__,_/  /_.___/ 	#
#														#
#########################################################

# @author		André Lademann <info@andrelademann.de>
# @copyright	André Lademann, 2014
# @license		http://andrelademann.de/license/mit

# Vars
## Directories
if [ ! -z $1 ];
then
    PACHUB_PATH=$1
else
    PACHUB_PATH="./"
fi

if [ ! -z $2 ];
then
    GIT_PATH=$2
else
    GIT_PATH="git"
fi

## Date
WEEKDAY_NUM=`date +%u`;
WEEK_NUM=`date +%V`;

## Pacman pattern
case "$WEEKDAY_NUM" in
  0) CURRENT_DAY=(1 1 1 1 1 1 1 3 3 3 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 4 4 4 4 1 1 1 1 1 1 3 3 3 3 3 1 1 1 1) ;;
  1) CURRENT_DAY=(1 1 1 1 1 1 3 3 3 3 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 3 3 3 3 3 4 1 1 1 1 3 2 2 2 2 2 3 1 1 1) ;;
  2) CURRENT_DAY=(1 1 1 1 1 3 3 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 3 0 0 3 0 0 3 4 1 1 3 2 0 0 2 0 0 2 3 1 1) ;;
  3) CURRENT_DAY=(1 1 1 1 1 3 3 3 3 1 1 1 1 1 1 4 1 1 4 1 1 4 1 1 1 1 1 1 1 1 1 1 4 3 4 0 3 4 0 3 4 1 1 3 2 4 0 2 4 0 2 3 1 1) ;;
  4) CURRENT_DAY=(1 1 1 1 1 3 3 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 3 3 3 3 3 3 3 4 1 1 3 2 2 2 2 2 2 2 3 1 1) ;;
  5) CURRENT_DAY=(1 1 1 1 1 1 3 3 3 3 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 4 3 4 3 4 3 4 4 1 1 3 3 2 3 2 3 2 3 3 1 1) ;;
  6) CURRENT_DAY=(1 1 1 1 1 1 1 3 3 3 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 1 4 1 4 1 4 1 4 1 1 3 1 3 1 3 1 3 1 3 1 1) ;;
esac

## Calculate how many times today changes to be made
REPEAT=${CURRENT_DAY[$((WEEK_NUM-1))]}*${CURRENT_DAY[$((WEEK_NUM-1))]};

## Random messages
RANDMSG[0]='There my hairs stand up to the mountain';
RANDMSG[1]='I understand just train-station';
RANDMSG[2]='I see black for you';
RANDMSG[3]='I fall from all clouds';
RANDMSG[4]='Sponge over!'
RANDMSG[5]='How horny is that then !?'
RANDMSG[6]='Then you look dumb out of the laundry'
RANDMSG[7]='I always think that by my self out'
RANDMSG[8]='That comes overhead not in question!'
RANDMSG[9]='Now is end with funny'

# Function to commit
function pacommit() {
  # 0. Caculate count of changes of the day
  local NUM_RANDMSG=${#RANDMSG[*]}
  local MSG="#$((RANDOM%NUM_RANDMSG)) ${RANDMSG[$((RANDOM%NUM_RANDMSG))]}"

  # 1. create changes
  cd ${PACHUB_PATH} && echo ${MSG} >> game.pgb

  # 2. add changes to git
  cd ${PACHUB_PATH} && ${GIT_PATH} add game.pgb

  # 3. create a random git message and commit
  cd ${PACHUB_PATH} && ${GIT_PATH} commit -m"${MSG}" >> git.log
}

# Call function
for ((i=1; i<=${REPEAT}; i++)); do
  pacommit;
done

# 4. push commit all changes to remote repository
cd ${PACHUB_PATH} && ${GIT_PATH} push >> git.log
