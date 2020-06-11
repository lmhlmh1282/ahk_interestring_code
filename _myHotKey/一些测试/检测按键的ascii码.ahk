#persistent
;一些消息映射:
;WM_KEYDOWN = 0x100
;WM_KEYUP = 0x101
Gui, Add, Text,, Click anywhere in this window.
Gui, Add, Edit, w200 vMyEdit
Gui, Show
OnMessage(0x100,"OnKeyDown")

OnKeyDown(wParam, lParam)
{

	tooltip,%wParam%    
	return
}