#/bin/bash
xset +fp /etc/X11/fonts/misc
xset fp rehash

xset -b # disable bell
eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout us -option ctrl:nocaps

while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date +%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
    BAT="$(acpi -b | awk '{ print $4 }' | tr -d ',')"

	if acpi -b | grep Charging > /dev/null
	then
		xsetroot -name "$IP +$BAT $LOCALTIME"
	else
		xsetroot -name "$IP $BAT $LOCALTIME"
	fi
	sleep 20s
done &

exec ~/bin/startdwm
