<%@ page contentType="text/html; charset=euc-kr" %>


 <SCRIPT language="javascript">			///////////////////////////////////////////////////////////////////////
			var m21=new Array()  
	        m21[0] = "������1 ���뼳��"; 
			m21[1] = "������2 ���뼳��"; 
	        m21[2] = "������3 ���뼳��"; 
	        m21[3] = "������4 ���뼳��"; 
	        m21[4] = "������5 ���뼳��"; 
			</script>

<SCRIPT language="javascript">
			<!--
	        var m21_width=200           // ������ ��
	        var m21_height=200           // ������ ����
		    var m21_bgcolor='#FFFFFF'     // ������ ����
			var m21_background=''         // ������ ��� �̹���
	        var m21_cnt = 0               // �޼��� ����
	        var m21_speed='10'            // ��ũ�� �ӵ�(����:ms)
	        var m21_wait='4000'           // �޼��� ���� �ð�(����:ms)
	        var m21_timerID=''            // Ÿ�̸� ID
	        var m21_idx=0                 // ÷��

	        document.writeln("<style>")
		    document.writeln(" #m21_layer1 { position:absolute; width:'+m21_width+'; height:'+m21_height+'; top:0; left:0;}")
			document.writeln(" #m21_layer2 { position:absolute; width:'+m21_width+'; height:'+m21_height+'; top:0; left:0;}")
	        document.writeln("</style>")

		    document.writeln('<span style="position:relative;width:'+m21_width+';height:'+m21_height+';top:0;left:0;background-color:'+m21_bgcolor+'">')
			document.writeln('<div onMouseOver="m21_mouseover()" onMouseOut="m21_mouseout()" style="position:absolute;width:'+m21_width+';height:'+m21_height+';top:0;left:0;clip:rect(0 '+m21_width+' '+m21_height+' 0);overflow:hidden;">')

			document.writeln("<div id='m21_layer1'>")
			document.write(m21[0])
			document.writeln("</div>")

	        document.writeln("<div id='m21_layer2'>")
	        if(m21.length == 1)
                m21[1] = m21[0]
		    m21_cnt = m21.length
			document.write(m21[1])
	        document.writeln("</div>")

	        document.writeln("</div>")
		    document.writeln("</span>")

			function m21_mouseover(){                                                               // ���콺 over �� ��ũ�� ����
                if(m21_timerID)                        clearTimeout(m21_timerID)
	        }

		    function m21_mouseout(){                                                               // ���콺�� ���� ������ �� ��ũ�� �����
                m21_timerID = setTimeout("m21_scroll()",m21_speed)
	        }

		    function m21_scroll(){
                document.all["m21_layer1"].style.pixelTop = document.all["m21_layer1"].style.pixelTop - 1
                document.all["m21_layer2"].style.pixelTop = document.all["m21_layer2"].style.pixelTop - 1

                if(document.all["m21_layer2"].style.pixelTop == 0){
                   document.all["m21_layer1"].innerHTML = m21[m21_idx]
                   document.all["m21_layer1"].style.pixelTop = 0
                        m21_idx=(m21_idx+1)%m21_cnt                                                // ������ �� �޼����� �����ϱ� ���� ÷�� ����
                        document.all["m21_layer2"].innerHTML = m21[m21_idx]
                        document.all["m21_layer2"].style.pixelTop = m21_height+1
                        m21_timerID = setTimeout("m21_scroll()",m21_wait)
                }else{
                        m21_timerID = setTimeout("m21_scroll()",m21_speed)
                }
        }

        function m21_StartScroll(){                                                                                        // �������� �ε�Ǹ� �� �� �� ����Ǵ� ����
                document.all["m21_layer1"].innerHTML = m21[0]
                document.all["m21_layer2"].innerHTML = m21[1]
                document.all["m21_layer2"].style.pixelTop = m21_height+1
                m21_idx=1

                m21_timerID = setTimeout("m21_scroll()",m21_speed)
        }
  
		  m21_StartScroll()
	//-->
	</script> 