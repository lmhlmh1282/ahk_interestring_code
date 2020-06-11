SetTitleMatchMode,2   ;匹配包含指定的 WinTitle 的窗口标题。
;;项目利用的执行文件目录123456789
CUR_DIR=%A_ScriptDir%
winTitle1=MY_PLANS.xlsx
winAhkExe=EXCEL.EXE
filePath = I:\MY_PLANS.xlsx
ifNotExist,%filePath%
{
	msgbox,% 48,,%filePath%不存在
	return
}
;系统当前存不存在运行的该程序，不存在就重新打开文件
IfWinNotExist, %winTitle1% ahk_exe %winAhkExe%
{
	run,"%A_ScriptDir%\Excel_MYPLANS_cp.ahk"     ;打开时要先备份
    run,excel.exe %filePath%,,max
	;;Run要传递参数, 请让它们紧跟在程序或文档名的后面. 如果参数包含空格, 则把它们括在双引号中是最可靠的(虽然它在某些情况下没有括在双引号中也能工作).
	return
} 

;;有没有激活，没有显示就显示，已经显示就拷贝保存
IfWinNotActive, %winTitle1% ahk_exe %winAhkExe%
{

	;WinRestore  ;显示窗口。
	WinActivate
	WinMaximize ;
	return
}

else IfWinActive, %winTitle1% ahk_exe %winAhkExe%
{
	;该窗口已经激活
	
    run,"%A_ScriptDir%\Excel_MYPLANS_cp.ahk"   ;备份
	return

}




