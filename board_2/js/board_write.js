<!-- 

function send() {
	var	form = document.frm1;
	
	if(form.reg_name.value.length < 1  ){
		alert("�ۼ��ڸ� �Է��� �ּ���!");
		form.reg_name.focus();
		return; 
	}
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
	if(form.file_name1.value.length == "*.jsp" ){
		alert("jsp ������ ���ε� �� �� �����ϴ�!");
		form.file_name1.focus();
		return; 
	}
	
    form.action="board_process.jsp";
	form.submit();
}	

function rep_send() {
	var	form = document.frm1;
	if(form.reg_name.value.length < 1 ){
		alert("�ۼ��� ������ �Է��� �ּ���!");
		form.reg_name.focus();
		return; 
	}

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

function check() {
	var	form = document.frm1;
	form.action = "board_list.jsp";
	form.submit();
}	

function checkU() {
	var	form = document.frm1;
	form.action = "Uboard_list.jsp";
	form.submit();
}	

function selectall(val) {
    var  form = document.frm2;
    var sw = form.no_all.value;
    var tf = true;
    if(sw == "1") {
       tf = true;
       form.no_all.value = 2;
    }else  {
       tf = false;   
       form.no_all.value = 1;
    }  
    
	var cbox = document.frm2.no;
 	len = cbox.length;
 	var i=0;
 	for( i=0 ; i<len ; i++) {
 		//if (val == 0) cbox.no[i].checked=false;
 		cbox.no[i].checked=tf;
 	}
} 

function multi_del() {
	var	form = document.frm2;
	
	form.action	= "board_process.jsp";
	//form.cmd.value="multi_del";
	var del_cnt = 0;
	
	for( var i=0; i<form.length; i++){
		if(form.elements[i].name =="no" && form.elements[i].checked){
			del_cnt++; //���õ� üũ�ڽ�����
		}//end_if
	}//end_for		
						
	//���� ������ ���� �ʾҴٸ�
	if(del_cnt ==0) {
		alert("������ �Խù��� �������ּ���");
		return;
	}
	else { //�����Ͽ��ٸ�
		if(confirm("������ ��� �Խù��� �����Ͻðڽ��ϱ�?")){
			form.submit();
		}else{
			return;
		}		
	}
}		
//-->