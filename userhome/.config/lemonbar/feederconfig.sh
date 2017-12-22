#!/usr/bin/zsh

# Essentially, this file stores and updates important data 
# that is fed into lemonbar.

# Additionally, it is used for configuring the lemonbar setup.

# This file does most of the grunt work, then 
# feeder.sh does the final steps, such as assembling 
# and formatting the data.

#Actual configuration happens here
MAINFONT="Fira Mono for Powerline:size=14"
ICONFONT="PowerlineSymbols:size=14"

#Colors
WHITE="#B2FFFFFF"
BLACK="#B2000000"

#Powerline Stuff
HARD_SEP_LEFT=""
LIGHT_SEP_LEFT=""
HARD_SEP_RIGHT=""
LIGHT_SEP_RIGHT=""

# These are empty strings that are filled by loadData().
# They have to be in caps to avoid confusion with 
# certain identically named shell programs.
DAY=""
DATE=""
TIME=""
BATT_LEVEL=""
IS_CHARGING=""
VOL_LEVEL=""

# This function is called repeatedly by feeder.sh to update
# the variables
loadData() {
	DAY=$(sysinfo dayOfWeek)
	DATE=$(sysinfo simpleDate)
	TIME=$(sysinfo time12)
	BATT_LEVEL=$(sysinfo battLevel)

	if [ $(sysinfo battCharging) = "CHARGING" ]; then
		IS_CHARGING="▲"
	else 
		IS_CHARGING="▼"
	fi

	VOL_LEVEL="$(sysinfo volLevel)"

	
}