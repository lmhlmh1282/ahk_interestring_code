inifilePath=%A_ScriptDir%\dupFiles.ini
cnt:=1    ;我们的条目计数
FromPathArr := []   ;数组，没一条表示被复制的文件名
ToPathArr := []   ;数组，每一条表示要复制到的地方
PARAM_CNT = %0%
;执行总代码
readFile()
opCopy()  ;命令行执行


    


;函数 读取ini文件


readFile(){
    global FromPathArr
    global ToPathArr
    global cnt:=1
    global inifilePath
    loop ;循环
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
        ;放入数组中
		FromPathArr[cnt] := FPContent
        ToPathArr[cnt] := TPContent
        output1:=FromPathArr[cnt]
        output2:=ToPathArr[cnt]
        
        ;msgbox, %output1%%output2%
		;数组可以把变量直接当下标，而不用引用符号%%
		cnt+=1
	}
	
}


;接收参数并执行复制

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
        Loop, %PARAM_CNT%  ;对每个参数执行一次：
        {
            param1 := %A_Index%  ;提取 A_Index 包含的变量名称里的内容。
            From_Path := FromPathArr[param1]
            TO_DIR :=ToPathArr[param1]
            ;复制操作
            a_filecopy(From_Path,TO_DIR)
        }
        
    }

    
 }

;复制操作函数
 a_filecopy(From_Path,TO_DIR)
 {
   
           
    IfExist, %From_Path%
    {
      FileCopy,%From_Path%,%TO_DIR%\ ,1  ;;1覆盖
      MsgBox,,,%From_Path% 已复制成功到 %TO_DIR%,3
    }
    else{
      MsgBox,,,%From_Path% 被复制失败 ,3
    }
 }
