#!/usr/bin/zsh

# Pulls all the data from the feederconfig
# including the functions.
source $(dirname "$0")/feederconfig.sh 

# This is where everything is assembled



DATA=""

buildString() {
	DATE_MODULE="${LIGHT_SEP_LEFT} ${DAY} ${DATE} ${LIGHT_SEP_RIGHT}"
	TIME_MODULE="${LIGHT_SEP_LEFT} ${TIME} ${LIGHT_SEP_RIGHT}"
	CENTER_MODULE="${DATE_MODULE}~${TIME_MODULE}"
	
	#Build right module
	BATT_MODULE="${LIGHT_SEP_LEFT} BAT:${BATT_LEVEL}${IS_CHARGING} ${LIGHT_SEP_RIGHT}"
	VOL_MODULE="${LIGHT_SEP_LEFT} VOL:${VOL_LEVEL} ${LIGHT_SEP_RIGHT}"
	RIGHT_MODULE="${VOL_MODULE}~${BATT_MODULE}"

	DATA=" %{B${WHITE} F${BLACK}} %{c} ${CENTER_MODULE} %{r} ${RIGHT_MODULE} "
}

# This sends the data off to lemonbar
feedBar() {
	echo ${DATA}
}

# This is where the bar is constantly updated.
# An infinite loop is fine because the program is not meant
# to be killed.
while true; do
	# Update the bar
	loadData
	buildString
	feedBar

	# Avoid killing the CPU
	sleep 0.2
done
