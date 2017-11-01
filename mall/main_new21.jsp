<%@ page contentType="text/html; charset=euc-kr" %>


 <SCRIPT language="javascript">			///////////////////////////////////////////////////////////////////////
			var m21=new Array()  
	        m21[0] = "도서명1 내용설명"; 
			m21[1] = "도서명2 내용설명"; 
	        m21[2] = "도서명3 내용설명"; 
	        m21[3] = "도서명4 내용설명"; 
	        m21[4] = "도서명5 내용설명"; 
			</script>

<SCRIPT language="javascript">
			<!--
	        var m21_width=200           // 영역의 폭
	        var m21_height=200           // 영역의 높이
		    var m21_bgcolor='#FFFFFF'     // 영역의 배경색
			var m21_background=''         // 영역의 배경 이미지
	        var m21_cnt = 0               // 메세지 갯수
	        var m21_speed='10'            // 스크롤 속도(단위:ms)
	        var m21_wait='4000'           // 메세지 멈춤 시간(단위:ms)
	        var m21_timerID=''            // 타이머 ID
	        var m21_idx=0                 // 첨자

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

			function m21_mouseover(){                                                               // 마우스 over 시 스크롤 멈춤
                if(m21_timerID)                        clearTimeout(m21_timerID)
	        }

		    function m21_mouseout(){                                                               // 마우스가 빠져 나갔을 때 스크롤 재시작
                m21_timerID = setTimeout("m21_scroll()",m21_speed)
	        }

		    function m21_scroll(){
                document.all["m21_layer1"].style.pixelTop = document.all["m21_layer1"].style.pixelTop - 1
                document.all["m21_layer2"].style.pixelTop = document.all["m21_layer2"].style.pixelTop - 1

                if(document.all["m21_layer2"].style.pixelTop == 0){
                   document.all["m21_layer1"].innerHTML = m21[m21_idx]
                   document.all["m21_layer1"].style.pixelTop = 0
                        m21_idx=(m21_idx+1)%m21_cnt                                                // 다음에 올 메세지를 선택하기 위한 첨자 결정
                        document.all["m21_layer2"].innerHTML = m21[m21_idx]
                        document.all["m21_layer2"].style.pixelTop = m21_height+1
                        m21_timerID = setTimeout("m21_scroll()",m21_wait)
                }else{
                        m21_timerID = setTimeout("m21_scroll()",m21_speed)
                }
        }

        function m21_StartScroll(){                                                                                        // 페이지가 로드되면 단 한 번 실행되는 문장
                document.all["m21_layer1"].innerHTML = m21[0]
                document.all["m21_layer2"].innerHTML = m21[1]
                document.all["m21_layer2"].style.pixelTop = m21_height+1
                m21_idx=1

                m21_timerID = setTimeout("m21_scroll()",m21_speed)
        }
  
		  m21_StartScroll()
	//-->
	</script> 