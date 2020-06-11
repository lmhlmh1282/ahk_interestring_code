;显示时间
#SingleInstance Force
    updateDateTimeStr()
	Gui_color1= black
	font_color1=Cwhite
	Gui, -SysMenu -Caption +ToolWindow +AlwaysOnTop +E0x20
	;先控制属性，下面依据这些属性加窗口
	Gui, Color, %Gui_color1%
	gui, font,s20 %font_color1%, Arial
	;;注意"vMyText" 定义了该控件的变量，该变量"MyText"将是全局变量（或是引用类型变量，或一个静态变量）。
    Gui,add,Text,vMyText, %timestr% 
	Gui,show,AutoSize Center  
	
	;设置刷新时间，重复地刷新。
	SetTimer, UpdateClock, 1000
	;键盘点击事件
	OnMessage(0x100, "ON_WM_KEYDOWN")
	OnMessage(0x202, "ON_WM_LBUTTONUP")
	
	
    return
	
	
	UpdateClock:
	{
	  global timestr
	  updateDateTimeStr()
	  GuiControl,,MyText,%timestr%
      return
	}
	ON_WM_KEYUP()
	{
	   exitapp
       return ;退出
	}
	
	ON_WM_KEYDown()
	{
		;keydown 再keyup防止开始就有keyup事件响应
	   OnMessage(0x101, "ON_WM_KEYUP")
	   return ;退出
	}
	ON_WM_LBUTTONUP()
	{
	   exitapp
       return ;退出
	}
	
	updateDateTimeStr(){
	   global timestr
	   timestr=%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% %A_DDD%
	   
	   
	}
	
	;一些消息映射:
	;WM_KEYDOWN = 0x100
    ;WM_KEYUP = 0x101
	;WM_MOUSEMOVE = 0x200
	;WM_LBUTTONDOWN = 0x201
	;WM_LBUTTONUP = 0x202
	;WM_LBUTTONDBLCLK = 0x203
	;WM_RBUTTONDOWN = 0x204
	;WM_RBUTTONUP = 0x205
	;WM_RBUTTONDBLCLK = 0x206
	;WM_MBUTTONDOWN = 0x207
	;WM_MBUTTONUP = 0x208
	;WM_MBUTTONDBLCLK = 0x209

