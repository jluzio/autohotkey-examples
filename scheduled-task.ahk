; Define a variable to toggle the task
global taskEnabled := true
; Define the period in ms for repeating the action
global taskPeriod := 60000

; Task
task() {
    ; TrayTip "Task!"
    MouseMove(1, 0, 0, "R")
    MouseMove(-1, 0, 0, "R")
}

; Set the timer to call action
SetTimer(taskTimer, taskPeriod)

; Toggle the taskEnabled variable with Ctrl + « (Left Double Angle Quote)
^!«:: {
    global taskEnabled
    taskEnabled := !taskEnabled
    if (taskEnabled) {
        TrayTip "Task enabled."
    } else {
        TrayTip "Task disabled."
    }
}

; Function that checks if taskEnabled is true, then calls the action
taskTimer() {
    if (taskEnabled) {
        task()
    }
}

