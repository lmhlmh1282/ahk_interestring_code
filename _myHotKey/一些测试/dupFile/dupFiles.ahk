inifilePath=%A_ScriptDir%\dupFiles.ini
cnt:=1    ;���ǵ���Ŀ����
FromPathArr := []   ;���飬ûһ����ʾ�����Ƶ��ļ���
ToPathArr := []   ;���飬ÿһ����ʾҪ���Ƶ��ĵط�
PARAM_CNT = %0%
;ִ���ܴ���
readFile()
opCopy()  ;������ִ��


    


;���� ��ȡini�ļ�


readFile(){
    global FromPathArr
    global ToPathArr
    global cnt:=1
    global inifilePath
    loop ;ѭ��
	{
        keyNameFP=FromPath%cnt%
        keyNameTP=ToPath%cnt%
        
        ;;;;;;FromPath
		IniRead,FPContent,%inifilePath%,startapp,%keyNameFP%,"error"
        IniRead,TPContent,%inifilePath%,startapp,%keyNameTP%,"error"
        ;msgbox,%FPContent% %TPContent%
        ;
        if FPContent="error" 
		{
		  cnt-=1
		  return
		}else if TPContent="error"
        {
          cnt-=1
		  return
        }
        ;����������
		FromPathArr[cnt] := FPContent
        ToPathArr[cnt] := TPContent
        output1:=FromPathArr[cnt]
        output2:=ToPathArr[cnt]
        
        ;msgbox, %output1%%output2%
		;������԰ѱ���ֱ�ӵ��±꣬���������÷���%%
		cnt+=1
	}
	
}


;���ղ�����ִ�и���

opCopy(){
    global FromPathArr
    global ToPathArr
    global PARAM_CNT
    
    ;msgbox,%PARAM_CNT%
    
    if (PARAM_CNT < 1)
    {
        return
    }

    else if (PARAM_CNT >= 1 )
    {
        param := "" 
        Loop, %PARAM_CNT%  ;��ÿ������ִ��һ�Σ�
        {
            param1 := %A_Index%  ;��ȡ A_Index �����ı�������������ݡ�
            From_Path := FromPathArr[param1]
            TO_DIR :=ToPathArr[param1]
            ;���Ʋ���
            a_filecopy(From_Path,TO_DIR)
        }
        
    }

    
 }

;���Ʋ�������
 a_filecopy(From_Path,TO_DIR)
 {
   
           
    IfExist, %From_Path%
    {
      FileCopy,%From_Path%,%TO_DIR%\ ,1  ;;1����
      MsgBox,,,%From_Path% �Ѹ��Ƴɹ��� %TO_DIR%,3
    }
    else{
      MsgBox,,,%From_Path% ������ʧ�� ,3
    }
 }
