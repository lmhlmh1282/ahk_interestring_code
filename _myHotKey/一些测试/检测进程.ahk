winTitle1=ʱ��滮��.xlsx
winAhkExe=EXCEL.EXE
While, True
{
;ϵͳ��ǰ�治�������еĸó���
IfWinNotExist, %winTitle1% ahk_exe %winAhkExe%
{
	msgbox,������
} 

IfWinExist, %winTitle1%  ahk_exe %winAhkExe%
{
	msgbox,����

}

Sleep, 2000 
}