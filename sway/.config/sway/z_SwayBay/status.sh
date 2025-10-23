# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
# uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# sensor1=$(sensors coretemp-isa-0000  | awk '/Core 0:/ {print $3}')
# sensor2=$(sensors coretemp-isa-0000  | awk '/Core 1:/ {print $3}')

ip_local=$(ip -4 -br addr show enp6s0f0 | grep -oE '[0-9]{3}.[0-9]{3}.[0-9]{2}.[0-9]{3}')
ip_world=$(curl --silent ifconfig.me)

MEM=$(free -Lh | sed -E "s/ +/ /g" | sed "s/SwapUse/Swap/" | sed -e "s/CachUse/- Cache/" | sed -e "s/MemUse/- Mem/" | sed -e "s/MemFree/- Free/")

date=$(date "+%d/%m %H:%M:%S")

# load average
LA=$(cat /proc/loadavg)

# Get the Linux version but remove the "-1-ARCH" part
# linux_version=$(uname -r | cut -d '-' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
# battery_status=$(cat /sys/class/power_supply/BAT1/status)
# battery=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|

# echo "$MEM LA($LA) IP($ip_local,$ip_world) $date $sensor1 $sensor2 🐧 $battery_status 🔋 $date_formatted"

# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1 }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

# Now send blocks with information forever:
while :;
do
  echo ",[{\"name\":\"id_time\",\"full_text\":\"$date\"}]"
  sleep 1
done

