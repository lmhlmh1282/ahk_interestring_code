SetTitleMatchMode,2   ;ƥ�����ָ���� WinTitle �Ĵ��ڱ��⡣
;;��Ŀ���õ�ִ���ļ�Ŀ¼123456789
CUR_DIR=%A_ScriptDir%
winTitle1=MY_PLANS.xlsx
winAhkExe=EXCEL.EXE
filePath = I:\MY_PLANS.xlsx
ifNotExist,%filePath%
{
	msgbox,% 48,,%filePath%������
	return
}
;ϵͳ��ǰ�治�������еĸó��򣬲����ھ����´��ļ�
IfWinNotExist, %winTitle1% ahk_exe %winAhkExe%
{
	run,"%A_ScriptDir%\Excel_MYPLANS_cp.ahk"     ;��ʱҪ�ȱ���
    run,excel.exe %filePath%,,max
	;;RunҪ���ݲ���, �������ǽ����ڳ�����ĵ����ĺ���. ������������ո�, �����������˫����������ɿ���(��Ȼ����ĳЩ�����û������˫������Ҳ�ܹ���).
	return
} 

;;��û�м��û����ʾ����ʾ���Ѿ���ʾ�Ϳ�������
IfWinNotActive, %winTitle1% ahk_exe %winAhkExe%
{

	;WinRestore  ;��ʾ���ڡ�
	WinActivate
	WinMaximize ;
	return
}

else IfWinActive, %winTitle1% ahk_exe %winAhkExe%
{
	;�ô����Ѿ�����
	
    run,"%A_ScriptDir%\Excel_MYPLANS_cp.ahk"   ;����
	return

}




