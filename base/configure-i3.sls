{% for user, uid in pillar.get('users', {}).items() %}
/home/{{user}}/.config/i3/config:
  file.append:
    - text: "bindsym $mod+q exec \"rofi -modi window,drun,run -show drun -sidebar-mode -terminal xfce4-terminal -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000'\""
{% endfor %}
