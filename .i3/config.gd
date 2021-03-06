# This configuration uses Mod4 and Mod3. Make sure they are mapped properly using xev(1)
# and xmodmap(1). Usually, Mod4 is Alt (Alt_L) and Mod3 is Windows (Super_L)

# ISO 10646 = Unicode
font -*-clean-*-*-*--*-*-*-*-*-*-iso10646-1

# Use Mouse+Mod4 to drag floating windows to their wanted position
floating_modifier Mod4

# Fullscreen (Mod4+f)
bind Mod4+41 f

# Stacking (Mod4+h)
bind Mod4+43 s

# Tabbed (Mod4+w)
bind Mod4+25 T

# Default (Mod4+e)
bind Mod4+26 d

# Toggle tiling/floating of the current window (Mod4+Shift+Space)
bind Mod4+Shift+65 t

# Go into the tiling layer / floating layer, depending on whether
# the current window is tiling / floating (Mod4+t)
bind Mod4+28 focus ft

# Focus (Mod4+j/k/l/;)
bind Mod4+44 h
bind Mod4+45 j
bind Mod4+46 k
bind Mod4+47 l
# (alternatively, you can use the cursor keys:)
bindsym Mod4+Left h
bindsym Mod4+Down j
bindsym Mod4+Up k
bindsym Mod4+Right l

# Focus Container (Mod3+j/k/l/;)
bind Mod3+44 wch
bind Mod3+45 wcj
bind Mod3+46 wck
bind Mod3+47 wcl
# (alternatively, you can use the cursor keys:)
bindsym Mod3+Left wch
bindsym Mod3+Down wcj
bindsym Mod3+Up wck
bindsym Mod3+Right wcl

# Snap (Mod4+Control+j/k/l/;)
bind Mod4+Control+44 sh
bind Mod4+Control+45 sj
bind Mod4+Control+46 sk
bind Mod4+Control+47 sl
# (alternatively, you can use the cursor keys:)
bindsym Mod4+Control+Left sh
bindsym Mod4+Control+Down sj
bindsym Mod4+Control+Up sk
bindsym Mod4+Control+Right sl

# Move (Mod4+Shift+j/k/l/;)
bind Mod4+Shift+44 mh
bind Mod4+Shift+45 mj
bind Mod4+Shift+46 mk
bind Mod4+Shift+47 ml
# (alternatively, you can use the cursor keys:)
bindsym Mod4+Shift+Left mh
bindsym Mod4+Shift+Down mj
bindsym Mod4+Shift+Up mk
bindsym Mod4+Shift+Right ml

# Move Container (Mod3+Shift+j/k/l/;)
bind Mod3+Shift+44 wcmh
bind Mod3+Shift+45 wcmj
bind Mod3+Shift+46 wcmk
bind Mod3+Shift+47 wcml

# Workspaces (Mod4+1/2/…)
bind Mod4+10 1
bind Mod4+11 2
bind Mod4+12 3
bind Mod4+13 4
bind Mod4+14 5
bind Mod4+15 6
bind Mod4+16 7
bind Mod4+17 8
bind Mod4+18 9
bind Mod4+19 10

# Move to Workspaces
bind Mod4+Shift+10 m1
bind Mod4+Shift+11 m2
bind Mod4+Shift+12 m3
bind Mod4+Shift+13 m4
bind Mod4+Shift+14 m5
bind Mod4+Shift+15 m6
bind Mod4+Shift+16 m7
bind Mod4+Shift+17 m8
bind Mod4+Shift+18 m9
bind Mod4+Shift+19 m10

# Mod4+Enter starts a new terminal
bind Mod4+36 exec /usr/bin/gnome-terminal

# Mod4+Shift+q kills the current client
bind Mod4+Shift+24 kill
bind Mod4+70   # mod + f4 winlike close


# Mod4+v starts dmenu and launches the selected application
# for now, we don’t have a launcher of our own.
bind Mod4+55 exec /usr/bin/dmenu_run
bind Mod4+68 exec /usr/bin/dmenu_run   # mod + f2 gnome like run

# Mod4+Shift+e exits i3
bind Mod4+Shift+26 exit
bind Mod4+Shift+70 exit           #  mod + shift + f4 Exit wm
# Mod4+Shift+r restarts i3 inplace
bind Mod4+Shift+27 restart

# The IPC interface allows programs like an external workspace bar
# (i3-wsbar) or i3-msg (can be used to "remote-control" i3) to work.
ipc-socket ~/.i3/ipc.sock

new_container stacking

workspace 9 chat

#class                      border  backgr. text
client.focused              #000000 #00ff00 #000000
client.unfocused            #000000 #000000 #00ff00
client.focused_inactive     #000000 #000000 #00ff00
client.urgent               #ffffff #00ff00 #ffffff

bar.focused                 #00ff00 #00ff00 #000000
bar.unfocused               #000000 #000000 #00ff00
bar.urgent                  #ffffff #00ff00 #ffffff



#############################################################
# DELETE THE FOLLOWING LINES TO DISABLE THE WELCOME MESSAGE #
#############################################################
exec gnome-settings-daemon    # gtk theme, notifications and so
exec xcompmgr
exec /usr/local/bin/bars
exec gnome-do
