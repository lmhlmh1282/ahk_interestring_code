;��ʾʱ��
#SingleInstance Force
    updateDateTimeStr()
	Gui_color1= black
	font_color1=Cwhite
	Gui, -SysMenu -Caption +ToolWindow +AlwaysOnTop +E0x20
	;�ȿ������ԣ�����������Щ���ԼӴ���
	Gui, Color, %Gui_color1%
	gui, font,s20 %font_color1%, Arial
	;;ע��"vMyText" �����˸ÿؼ��ı������ñ���"MyText"����ȫ�ֱ����������������ͱ�������һ����̬��������
    Gui,add,Text,vMyText, %timestr% 
	Gui,show,AutoSize Center  
	
	;����ˢ��ʱ�䣬�ظ���ˢ�¡�
	SetTimer, UpdateClock, 1000
	;���̵���¼�
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
       return ;�˳�
	}
	
	ON_WM_KEYDown()
	{
		;keydown ��keyup��ֹ��ʼ����keyup�¼���Ӧ
	   OnMessage(0x101, "ON_WM_KEYUP")
	   return ;�˳�
	}
	ON_WM_LBUTTONUP()
	{
	   exitapp
       return ;�˳�
	}
	
	updateDateTimeStr(){
	   global timestr
	   timestr=%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% %A_DDD%
	   
	   
	}
	
	;һЩ��Ϣӳ��:
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

