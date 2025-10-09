#Include workspaces.ahk
; Launch Alacritty with WSL using Alt + Enter
!Enter::
Run, alacritty.exe,, , newPID
DetectHiddenWindows, On
WinWait, ahk_pid %newPID%
WinActivate, ahk_pid %newPID%
WinWaitActive, ahk_pid %newPID%
return

; Close active window with Alt + Q
!q::
WinClose, A
return

; Shutdown computer with Alt + X
!x::
DllCall("LockWorkStation")
return

; Directional window focus (Alt + H/J/K/L)
!h::FocusWindow("Left")
!j::FocusWindow("Down")
!k::FocusWindow("Up")
!l::FocusWindow("Right")

+PrintScreen::
Run, "C:\Program Files\Flameshot\bin\flameshot.exe" gui
return

; Move window using FancyZones-style snapping (Alt + Shift + H/J/K/L)
!+h::SendInput, #{Left}
!+j::SendInput, #{Down}
!+k::SendInput, #{Up}
!+l::SendInput, #{Right}
return

FocusWindow(direction) {
    CoordMode, Window, Screen
    CoordMode, Mouse, Screen

    WinGet, id, List,,, Program Manager
    WinGetPos, ax, ay, aw, ah, A
    acx := ax + aw // 2
    acy := ay + ah // 2

    closest := 99999
    target := 0

    Loop, %id%
    {
        this_id := id%A_Index%
        if (WinActive("ahk_id " this_id))
            continue
        WinGetPos, x, y, w, h, ahk_id %this_id%
        cx := x + w // 2
        cy := y + h // 2
        dx := cx - acx
        dy := cy - acy

        if (direction = "Left" and dx < 0 and Abs(dy) < h // 2 and Abs(dx) < closest)
            closest := Abs(dx), target := this_id
        else if (direction = "Right" and dx > 0 and Abs(dy) < h // 2 and dx < closest)
            closest := dx, target := this_id
        else if (direction = "Up" and dy < 0 and Abs(dx) < w // 2 and Abs(dy) < closest)
            closest := Abs(dy), target := this_id
        else if (direction = "Down" and dy > 0 and Abs(dx) < w // 2 and dy < closest)
            closest := dy, target := this_id
    }

    if (target) {
        WinActivate, ahk_id %target%
        WinWaitActive, ahk_id %target%, , 1
        WinGetPos, tx, ty, tw, th, ahk_id %target%
        MouseMove, % tx + tw // 2, % ty + th // 2, 10
    }
}
