<%@ page contentType="text/html; charset=euc-kr" %>


 <SCRIPT language="javascript">			///////////////////////////////////////////////////////////////////////
			var m11=new Array()  
	        m11[0] = '<img src="../jpg/book0.gif" width="135" height="185" border="0">'; 
			m11[1] = '<img src="../jpg/book1.gif" width="135" height="185" border="0">';
	        m11[2] = '<img src="../jpg/book2.gif" width="135" height="185" border="0">';
	        m11[3] = '<img src="../jpg/book3.gif" width="135" height="185" border="0">';
	        m11[4] = '<img src="../jpg/book4.gif" width="135" height="185" border="0">';
			</script>

<SCRIPT language="javascript">
			<!--
	        var m11_width=200           // ������ ��
	        var m11_height=200           // ������ ����
		    var m11_bgcolor='#FFFFFF'     // ������ ����
			var m11_background=''         // ������ ��� �̹���
	        var m11_cnt = 0               // �޼��� ����
	        var m11_speed='10'            // ��ũ�� �ӵ�(����:ms)
	        var m11_wait='4000'           // �޼��� ���� �ð�(����:ms)
	        var m11_timerID=''            // Ÿ�̸� ID
	        var m11_idx=0                 // ÷��

	        document.writeln("<style>")
		    document.writeln(" #m11_layer1 { position:absolute; width:'+m11_width+'; height:'+m11_height+'; top:0; left:0;}")
			document.writeln(" #m11_layer2 { position:absolute; width:'+m11_width+'; height:'+m11_height+'; top:0; left:0;}")
	        document.writeln("</style>")

		    document.writeln('<span style="position:relative;width:'+m11_width+';height:'+m11_height+';top:0;left:0;background-color:'+m11_bgcolor+'">')
			document.writeln('<div onMouseOver="m11_mouseover()" onMouseOut="m11_mouseout()" style="position:absolute;width:'+m11_width+';height:'+m11_height+';top:0;left:0;clip:rect(0 '+m11_width+' '+m11_height+' 0);overflow:hidden;">')

			document.writeln("<div id='m11_layer1'>")
			document.write(m11[0])
			document.writeln("</div>")

	        document.writeln("<div id='m11_layer2'>")
	        if(m11.length == 1)
                m11[1] = m11[0]
		    m11_cnt = m11.length
			document.write(m11[1])
	        document.writeln("</div>")

	        document.writeln("</div>")
		    document.writeln("</span>")

			function m11_mouseover(){                                                               // ���콺 over �� ��ũ�� ����
                if(m11_timerID)                        clearTimeout(m11_timerID)
	        }

		    function m11_mouseout(){                                                               // ���콺�� ���� ������ �� ��ũ�� �����
                m11_timerID = setTimeout("m11_scroll()",m11_speed)
	        }

		    function m11_scroll(){
                document.all["m11_layer1"].style.pixelTop = document.all["m11_layer1"].style.pixelTop - 1
                document.all["m11_layer2"].style.pixelTop = document.all["m11_layer2"].style.pixelTop - 1

                if(document.all["m11_layer2"].style.pixelTop == 0){
                   document.all["m11_layer1"].innerHTML = m11[m11_idx]
                   document.all["m11_layer1"].style.pixelTop = 0
                        m11_idx=(m11_idx+1)%m11_cnt                                                // ������ �� �޼����� �����ϱ� ���� ÷�� ����
                        document.all["m11_layer2"].innerHTML = m11[m11_idx]
                        document.all["m11_layer2"].style.pixelTop = m11_height+1
                        m11_timerID = setTimeout("m11_scroll()",m11_wait)
                }else{
                        m11_timerID = setTimeout("m11_scroll()",m11_speed)
                }
        }

        function m11_StartScroll(){                                                                                        // �������� �ε�Ǹ� �� �� �� ����Ǵ� ����
                document.all["m11_layer1"].innerHTML = m11[0]
                document.all["m11_layer2"].innerHTML = m11[1]
                document.all["m11_layer2"].style.pixelTop = m11_height+1
                m11_idx=1

                m11_timerID = setTimeout("m11_scroll()",m11_speed)
        }
  
		  m11_StartScroll()
	//-->
	</script> 