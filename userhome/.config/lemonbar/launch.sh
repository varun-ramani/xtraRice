source $(dirname "$0")/feederconfig.sh

killall -q lemonbar
$(dirname "$0")/feeder.sh | lemonbar -p -f "${ICONFONT}" -f "${MAINFONT}"
