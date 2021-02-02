. "${HOME}/.cache/wal/colors.sh"

conky --config="$XDG_CONFIG_HOME"/conky/conkyrc | /tmp/tcloop/lemonbar-xft/usr/bin/lemonbar \
	-f fixed \
	-f TakaoExMincho:size=8 \
	-g x28 -B "$background" \
	-F "$color5"
