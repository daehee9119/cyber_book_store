<%@ page contentType="text/html; charset=euc-kr" %>


 <SCRIPT language="javascript">			///////////////////////////////////////////////////////////////////////
			var m2=new Array()  
	        m2[0] = '<img src="../jpg/book0.gif" width="135" height="185" border="0">'; 
			m2[1] = '<img src="../jpg/book1.gif" width="135" height="185" border="0">';
	        m2[2] = '<img src="../jpg/book2.gif" width="135" height="185" border="0">';
	        m2[3] = '<img src="../jpg/book3.gif" width="135" height="185" border="0">';
	        m2[4] = '<img src="../jpg/book4.gif" width="135" height="185" border="0">';
			</script>

<SCRIPT language="javascript">
			<!--
	        var m2_width=200           // ������ ��
	        var m2_height=200           // ������ ����
		    var m2_bgcolor='#FFFFFF'     // ������ ����
			var m2_background=''         // ������ ��� �̹���
	        var m2_cnt = 0               // �޼��� ����
	        var m2_speed='10'            // ��ũ�� �ӵ�(����:ms)
	        var m2_wait='4000'           // �޼��� ���� �ð�(����:ms)
	        var m2_timerID=''            // Ÿ�̸� ID
	        var m2_idx=0                 // ÷��

	        document.writeln("<style>")
		    document.writeln(" #m2_layer1 { position:absolute; width:'+m2_width+'; height:'+m2_height+'; top:0; left:0;}")
			document.writeln(" #m2_layer2 { position:absolute; width:'+m2_width+'; height:'+m2_height+'; top:0; left:0;}")
	        document.writeln("</style>")

		    document.writeln('<span style="position:relative;width:'+m2_width+';height:'+m2_height+';top:0;left:0;background-color:'+m2_bgcolor+'">')
			document.writeln('<div onMouseOver="m2_mouseover()" onMouseOut="m2_mouseout()" style="position:absolute;width:'+m2_width+';height:'+m2_height+';top:0;left:0;clip:rect(0 '+m2_width+' '+m2_height+' 0);overflow:hidden;">')

			document.writeln("<div id='m2_layer1'>")
			document.write(m2[0])
			document.writeln("</div>")

	        document.writeln("<div id='m2_layer2'>")
	        if(m2.length == 1)
                m2[1] = m2[0]
		    m2_cnt = m2.length
			document.write(m2[1])
	        document.writeln("</div>")

	        document.writeln("</div>")
		    document.writeln("</span>")

			function m2_mouseover(){                                                               // ���콺 over �� ��ũ�� ����
                if(m2_timerID)                        clearTimeout(m2_timerID)
	        }

		    function m2_mouseout(){                                                               // ���콺�� ���� ������ �� ��ũ�� �����
                m2_timerID = setTimeout("m2_scroll()",m2_speed)
	        }

		    function m2_scroll(){
                document.all["m2_layer1"].style.pixelTop = document.all["m2_layer1"].style.pixelTop - 1
                document.all["m2_layer2"].style.pixelTop = document.all["m2_layer2"].style.pixelTop - 1

                if(document.all["m2_layer2"].style.pixelTop == 0){
                   document.all["m2_layer1"].innerHTML = m2[m2_idx]
                   document.all["m2_layer1"].style.pixelTop = 0
                        m2_idx=(m2_idx+1)%m2_cnt                                                // ������ �� �޼����� �����ϱ� ���� ÷�� ����
                        document.all["m2_layer2"].innerHTML = m2[m2_idx]
                        document.all["m2_layer2"].style.pixelTop = m2_height+1
                        m2_timerID = setTimeout("m2_scroll()",m2_wait)
                }else{
                        m2_timerID = setTimeout("m2_scroll()",m2_speed)
                }
        }

        function m2_StartScroll(){                                                                                        // �������� �ε�Ǹ� �� �� �� ����Ǵ� ����
                document.all["m2_layer1"].innerHTML = m2[0]
                document.all["m2_layer2"].innerHTML = m2[1]
                document.all["m2_layer2"].style.pixelTop = m2_height+1
                m2_idx=1

                m2_timerID = setTimeout("m2_scroll()",m2_speed)
        }
  
		  m2_StartScroll()
	//-->
	</script> 