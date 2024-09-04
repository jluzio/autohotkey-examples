; Define a variable to toggle the screen saver prevention action
global preventScreenSaver := true

; Function to move the mouse to prevent the screensaver
PreventScreenSaverAction() {
    ; Move the mouse 1 pixel to the right
    MouseMove(1, 0, 0, "R")
    ; Move the mouse 1 pixel to the left
    MouseMove(-1, 0, 0, "R")
}

; Set the timer to call PreventScreenSaverAction every 60000 milliseconds (1 minute)
SetTimer(CheckPreventScreenSaver, 60000)

; Toggle the preventScreenSaver variable with Ctrl + « (Left Double Angle Quote)
^!«:: {
	global preventScreenSaver
    preventScreenSaver := !preventScreenSaver
    if (preventScreenSaver) {
        TrayTip "Screen saver prevention enabled."
    } else {
        TrayTip "Screen saver prevention disabled."
    }
}

; Function that checks if preventScreenSaver is true, then calls the action
CheckPreventScreenSaver() {
    if (preventScreenSaver) {
        PreventScreenSaverAction()
    }
}

