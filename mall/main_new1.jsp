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
	        var m1_width=200           // 영역의 폭
	        var m1_height=200           // 영역의 높이
		    var m1_bgcolor='#FFFFFF'     // 영역의 배경색
			var m1_background=''         // 영역의 배경 이미지
	        var m1_cnt = 0               // 메세지 갯수
	        var m1_speed='10'            // 스크롤 속도(단위:ms)
	        var m1_wait='4000'           // 메세지 멈춤 시간(단위:ms)
	        var m1_timerID=''            // 타이머 ID
	        var m1_idx=0                 // 첨자

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

			function m1_mouseover(){                                                               // 마우스 over 시 스크롤 멈춤
                if(m1_timerID)                        clearTimeout(m1_timerID)
	        }

		    function m1_mouseout(){                                                               // 마우스가 빠져 나갔을 때 스크롤 재시작
                m1_timerID = setTimeout("m1_scroll()",m1_speed)
	        }

		    function m1_scroll(){
                document.all["m1_layer1"].style.pixelTop = document.all["m1_layer1"].style.pixelTop - 1
                document.all["m1_layer2"].style.pixelTop = document.all["m1_layer2"].style.pixelTop - 1

                if(document.all["m1_layer2"].style.pixelTop == 0){
                   document.all["m1_layer1"].innerHTML = m1[m1_idx]
                   document.all["m1_layer1"].style.pixelTop = 0
                        m1_idx=(m1_idx+1)%m1_cnt                                                // 다음에 올 메세지를 선택하기 위한 첨자 결정
                        document.all["m1_layer2"].innerHTML = m1[m1_idx]
                        document.all["m1_layer2"].style.pixelTop = m1_height+1
                        m1_timerID = setTimeout("m1_scroll()",m1_wait)
                }else{
                        m1_timerID = setTimeout("m1_scroll()",m1_speed)
                }
        }

        function m1_StartScroll(){                                                                                        // 페이지가 로드되면 단 한 번 실행되는 문장
                document.all["m1_layer1"].innerHTML = m1[0]
                document.all["m1_layer2"].innerHTML = m1[1]
                document.all["m1_layer2"].style.pixelTop = m1_height+1
                m1_idx=1

                m1_timerID = setTimeout("m1_scroll()",m1_speed)
        }
  
		  m1_StartScroll()
	//-->
	</script> 