<%@ page contentType="text/html; charset=euc-kr" %>


 <SCRIPT language="javascript">			///////////////////////////////////////////////////////////////////////
			var m1=new Array()  
	        m1[0] = '<img src="../jpg/book0.gif" width="135" height="185" border="0">'; 
			m1[1] = '<img src="../jpg/book1.gif" width="135" height="185" border="0">';
	        m1[2] = '<img src="../jpg/book2.gif" width="135" height="185" border="0">';
	        m1[3] = '<img src="../jpg/book3.gif" width="135" height="185" border="0">';
	        m1[4] = '<img src="../jpg/book4.gif" width="135" height="185" border="0">';
			</script>

<SCRIPT language="javascript">
			<!--
	        var m1_width=200           // ������ ��
	        var m1_height=200           // ������ ����
		    var m1_bgcolor='#FFFFFF'     // ������ ����
			var m1_background=''         // ������ ��� �̹���
	        var m1_cnt = 0               // �޼��� ����
	        var m1_speed='10'            // ��ũ�� �ӵ�(����:ms)
	        var m1_wait='4000'           // �޼��� ���� �ð�(����:ms)
	        var m1_timerID=''            // Ÿ�̸� ID
	        var m1_idx=0                 // ÷��

	        document.writeln("<style>")
		    document.writeln(" #m1_layer1 { position:absolute; width:'+m1_width+'; height:'+m1_height+'; top:0; left:0;}")
			document.writeln(" #m1_layer2 { position:absolute; width:'+m1_width+'; height:'+m1_height+'; top:0; left:0;}")
	        document.writeln("</style>")

		    document.writeln('<span style="position:relative;width:'+m1_width+';height:'+m1_height+';top:0;left:0;background-color:'+m1_bgcolor+'">')
			document.writeln('<div onMouseOver="m1_mouseover()" onMouseOut="m1_mouseout()" style="position:absolute;width:'+m1_width+';height:'+m1_height+';top:0;left:0;clip:rect(0 '+m1_width+' '+m1_height+' 0);overflow:hidden;">')

			document.writeln("<div id='m1_layer1'>")
			document.write(m1[0])
			document.writeln("</div>")

	        document.writeln("<div id='m1_layer2'>")
	        if(m1.length == 1)
                m1[1] = m1[0]
		    m1_cnt = m1.length
			document.write(m1[1])
	        document.writeln("</div>")

	        document.writeln("</div>")
		    document.writeln("</span>")

			function m1_mouseover(){                                                               // ���콺 over �� ��ũ�� ����
                if(m1_timerID)                        clearTimeout(m1_timerID)
	        }

		    function m1_mouseout(){                                                               // ���콺�� ���� ������ �� ��ũ�� �����
                m1_timerID = setTimeout("m1_scroll()",m1_speed)
	        }

		    function m1_scroll(){
                document.all["m1_layer1"].style.pixelTop = document.all["m1_layer1"].style.pixelTop - 1
                document.all["m1_layer2"].style.pixelTop = document.all["m1_layer2"].style.pixelTop - 1

                if(document.all["m1_layer2"].style.pixelTop == 0){
                   document.all["m1_layer1"].innerHTML = m1[m1_idx]
                   document.all["m1_layer1"].style.pixelTop = 0
                        m1_idx=(m1_idx+1)%m1_cnt                                                // ������ �� �޼����� �����ϱ� ���� ÷�� ����
                        document.all["m1_layer2"].innerHTML = m1[m1_idx]
                        document.all["m1_layer2"].style.pixelTop = m1_height+1
                        m1_timerID = setTimeout("m1_scroll()",m1_wait)
                }else{
                        m1_timerID = setTimeout("m1_scroll()",m1_speed)
                }
        }

        function m1_StartScroll(){                                                                                        // �������� �ε�Ǹ� �� �� �� ����Ǵ� ����
                document.all["m1_layer1"].innerHTML = m1[0]
                document.all["m1_layer2"].innerHTML = m1[1]
                document.all["m1_layer2"].style.pixelTop = m1_height+1
                m1_idx=1

                m1_timerID = setTimeout("m1_scroll()",m1_speed)
        }
  
		  m1_StartScroll()
	//-->
	</script> 