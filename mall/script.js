/*
	function click() {
		if ((event.button==2) || (event.button==2)) 
			{alert('���ϴ� �Ŵ�??');}
		}
		document.onmousedown=click
	}

	<A HREF="javascript:mail()">����õ ������ �����ּ���.</A>
*/
	function mail(){
		mail_str = "mailto:?subject=��õ ����Ʈ: "+location.href;
		mail_str += "&body=���⸦ �ѹ� �湮�� ������.";
		mail_str += "ȥ�� ���� �Ʊ���� ���� �����ϴ�."+location.href; 
		location.href = mail_str;
		}

	function loginCheck(){
		if(document.login.mem_id.value==""){
			alert("���̵� �Է��� �ּ���.");
			document.login.mem_id.focus();
			return;
		}
		if(document.login.mem_passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.login.mem_passwd.focus();
			return;
		}
		document.login.submit();
	}
	

	function memberReg(){
		document.location="Register.jsp";
	}
	
	function inputCheck(){
		if(document.regForm.mem_id.value==""){
			alert("���̵� �Է��� �ּ���.");
			document.regForm.mem_id.focus();
			return;
		}
		if(document.regForm.mem_passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regForm.mem_passwd.focus();
			return;
		}
		if(document.regForm.mem_repasswd.value==""){
			alert("��й�ȣ�� Ȯ���� �ּ���");
			document.regForm.mem_repasswd.focus();
			return;
		}
		if(document.regForm.mem_name.value==""){
			alert("�̸��� �Է��� �ּ���.");
			document.regForm.mem_name.focus();
			return;
		}
		if(document.regForm.mem_num1.value==""){
			alert("�ֹι�ȣ�� �Է��� �ּ���.");
			document.regForm.mem_num1.focus();
			return;
		}
		if(document.regForm.mem_num2.value==""){
			alert("�ֹι�ȣ�� �Է��� �ּ���.");
			document.regForm.mem_num2.focus();
			return;
		}
		if(document.regForm.mem_email.value==""){
			alert("�̸����� �Է��� �ּ���.");
			document.regForm.mem_email.focus();
			return;
		}
		if(document.regForm.mem_phone.value==""){
			alert("����ó�� �Է��� �ּ���.");
			document.regForm.mem_phone.focus();
			return;
		}
		if(document.regForm.mem_address.value==""){
			alert("�ּҸ� �Է��� �ּ���.");
			document.regForm.mem_zipcode.focus();
			return;
		}
		if(document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			document.regForm.mem_repasswd.focus();
			return;
		}

		
		var jumin1=regForm.mem_num1.value;
		var jumin2=regForm.mem_num2.value;
		var jumin=jumin1+jumin2;
		var index="234567892345";
		var total=0;
		for(var i=0;i<12;i++)
			total+=parseInt(jumin.charAt(i)*index.charAt(i));

		total=11-total%11;
		if(total==10)
			total=0;
		else if(total==11)
			total=1;

		if(total!=jumin.charAt(12))
		{
			alert("�ֹι�ȣ�� �ٽ� Ȯ���ϼ���.");
			document.regForm.mem_num1.value="";
			document.regForm.mem_num2.value="";
			document.regForm.mem_num1.focus();
			return;
		}

		if(document.regForm.mem_email.value==""){
			alert("�̸����� �Է��� �ּ���.");
			document.regForm.mem_email.focus();
			return;
		}

		var str=document.regForm.mem_email.value;	   
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.'); 
		var spacePos = str.indexOf(' ');
		var commaPos = str.indexOf(',');
		var eMailSize = str.length;
		if (atPos > 1 && atPos == atLastPos && 
		   dotPos > 3 && spacePos == -1 && commaPos == -1 
		   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
		else {
			  alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
			  document.regForm.mem_email.focus();
			  return;
		}

		document.regForm.submit();
	}
	
	function idCheck(id){
		if(id == ""){
			alert("���̵� �Է��� �ּ���.");
			document.regForm.mem_id.focus();
		}else{
			url="IdCheck.jsp?mem_id=" + id;
			window.open(url,"post","width=300, height=150");
		}
	}
	
	function zipCheck(){
			url="ZipCheck.jsp?check=y";
			window.open(url,"post","toolbar=no ,width=500 ,height=300,"+
						"directories=no, status=yes, scrollbars=yes, menubar=no");
	}

	
	function productDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}
	

	function cartUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function cartDelete(form) {
		form.flag.value="del";
		form.submit();
	}

	function Del(mem_id){
		document.del.mem_id.value=mem_id;
		document.del.submit();
	}