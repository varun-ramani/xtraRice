#!/usr/bin/zsh
scrot /tmp/lock.png
convert /tmp/lock.png -scale 5% -scale 2000% /tmp/lock2.png
i3lock -i /tmp/lock2.png
rm /tmp/lock*.png
