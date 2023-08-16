; --------------------
; Map CapsLock key to Esc or Ctrl depending on context
; AutoHotkey_2.0.4
; --------------------

; Ignore attempts to start this script if an instance is already running
#SingleInstance Ignore

global g_LastCtrlKeyDownTime := 0
global g_AbortSendEsc := false
global g_ControlRepeatDetected := false

*CapsLock::
{	
    if (g_ControlRepeatDetected)
    {
        return
    }

    Send "{Ctrl down}"
    global g_LastCtrlKeyDownTime := A_TickCount
    global g_AbortSendEsc := false
    global g_ControlRepeatDetected := true

    return
}

*CapsLock Up::
{
    Send "{Ctrl up}"
    global g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    if ((A_TickCount - g_LastCtrlKeyDownTime) <= 200)
    {
        SendInput "{Esc}"
    }
    return
}

~*^a::
~*^b::
~*^c::
~*^d::
~*^e::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^q::
~*^r::
~*^s::
~*^t::
~*^u::
~*^v::
~*^w::
~*^x::
~*^y::
~*^z::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Space::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Enter::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12::
{
    global g_AbortSendEsc := true
    return
}