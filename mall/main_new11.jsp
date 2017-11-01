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
	        var m11_width=200           // 영역의 폭
	        var m11_height=200           // 영역의 높이
		    var m11_bgcolor='#FFFFFF'     // 영역의 배경색
			var m11_background=''         // 영역의 배경 이미지
	        var m11_cnt = 0               // 메세지 갯수
	        var m11_speed='10'            // 스크롤 속도(단위:ms)
	        var m11_wait='4000'           // 메세지 멈춤 시간(단위:ms)
	        var m11_timerID=''            // 타이머 ID
	        var m11_idx=0                 // 첨자

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

			function m11_mouseover(){                                                               // 마우스 over 시 스크롤 멈춤
                if(m11_timerID)                        clearTimeout(m11_timerID)
	        }

		    function m11_mouseout(){                                                               // 마우스가 빠져 나갔을 때 스크롤 재시작
                m11_timerID = setTimeout("m11_scroll()",m11_speed)
	        }

		    function m11_scroll(){
                document.all["m11_layer1"].style.pixelTop = document.all["m11_layer1"].style.pixelTop - 1
                document.all["m11_layer2"].style.pixelTop = document.all["m11_layer2"].style.pixelTop - 1

                if(document.all["m11_layer2"].style.pixelTop == 0){
                   document.all["m11_layer1"].innerHTML = m11[m11_idx]
                   document.all["m11_layer1"].style.pixelTop = 0
                        m11_idx=(m11_idx+1)%m11_cnt                                                // 다음에 올 메세지를 선택하기 위한 첨자 결정
                        document.all["m11_layer2"].innerHTML = m11[m11_idx]
                        document.all["m11_layer2"].style.pixelTop = m11_height+1
                        m11_timerID = setTimeout("m11_scroll()",m11_wait)
                }else{
                        m11_timerID = setTimeout("m11_scroll()",m11_speed)
                }
        }

        function m11_StartScroll(){                                                                                        // 페이지가 로드되면 단 한 번 실행되는 문장
                document.all["m11_layer1"].innerHTML = m11[0]
                document.all["m11_layer2"].innerHTML = m11[1]
                document.all["m11_layer2"].style.pixelTop = m11_height+1
                m11_idx=1

                m11_timerID = setTimeout("m11_scroll()",m11_speed)
        }
  
		  m11_StartScroll()
	//-->
	</script> 