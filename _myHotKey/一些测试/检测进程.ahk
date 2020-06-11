winTitle1=时间规划表.xlsx
winAhkExe=EXCEL.EXE
While, True
{
;系统当前存不存在运行的该程序，
IfWinNotExist, %winTitle1% ahk_exe %winAhkExe%
{
	msgbox,不存在
} 

IfWinExist, %winTitle1%  ahk_exe %winAhkExe%
{
	msgbox,存在

}

Sleep, 2000 
}