
#!/bin/bash

# Dependencies: xdotool (sudo apt-get install xdotool)

# Functions

save_active () {
    # get current workspace
    ActiveDesktop="$(xdotool get_desktop)"
    # get current active window ID
    ActiveWindowID="$(xdotool getactivewindow)"
    # get current active window name
    ActiveWindowName="$(xdotool getwindowname "$ActiveWindowID")"
}

restore_active(){
    xdotool set_desktop "$ActiveDesktop"
    # Activating the root window (Desktop) results in an error message, so we
    # try to avoid it
    [[ "$ActiveWindowName" != "Desktop" ]] && xdotool windowactivate "$ActiveWindowID"
}

youtube_playpause(){
  xdotool search --name YouTube windowactivate
  sleep 0.1
  xdotool key --clearmodifiers k
}

# Main

## save active window and desktop
save_active
## activate Chrome YouTube window and send keyboard event
youtube_playpause
## restore previously active window/desktop
restore_active
