<!--
function send() {
	var	form = document.frm1;
	if(form.title.value.length < 1 ){
		alert("������ �Է��� �ּ���!");
		form.title.focus();
		return; 
	}
	if(form.content.value.length < 1 ){
		alert("������ �Է��� �ּ���!");
		form.content.focus();
		return; 
	}
    form.action="board_process.jsp";
	form.submit();
}		

function send_del() {
	var	form = document.frm1;
	form.action	= "board_process.jsp";
	
	if(confirm("�����Ͻðڽ��ϱ�?")){
		form.submit();
	}else{
		return;
	}		
	
}		
//-->
