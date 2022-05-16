#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

NumpadAdd:: Send, {Backspace}
NumpadMult:: Send, {Right}
NumpadSub:: Send, {Volume_Down}
Numpad0::send,% ["0",")"] [1+GetKeyState("Shift","p")]

#If GetKeyBoardLanguage(WinExist("A")) = 0x0422 or GetKeyboardLanguage(WinExist("A")) = 0x0419
Numpad1 & Numpad2::Send,% ["з","З"][1+GetKeyState("Shift","p")]
Numpad1 & Numpad3::Send,% ["ж","Ж"][1+GetKeyState("Shift","p")]
Numpad1 & Numpad5::Send,% ["б","Б"][1+GetKeyState("Shift","p")]
#If
Numpad1 & Numpad2::send,% ["p","P"] [1+GetKeyState("Shift","p")]
Numpad1 & Numpad3::send,% [";",":"] [1+GetKeyState("Shift","p")]
Numpad1 & Numpad5::send,% [",","<"] [1+GetKeyState("Shift","p")]


GetKeyboardLanguage(_hWnd=0)
{
	if !_hWnd
		ThreadId=0
	else
		if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
			return false
	if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
		return false
	return KBLayout & 0xFFFF
}


#InputLevel, 100
NumpadIns::Numpad0
NumpadEnd::Numpad1
NumpadDown::Numpad2
NumpadPgDn::Numpad3
NumpadLeft::Numpad4
NumpadClear::Numpad5
NumpadRight::Numpad6
NumpadHome::Numpad7
NumpadUp::Numpad8
NumpadPgUp::Numpad9
#InputLevel, 1
