
	function Update(mem_id){
		document.update.mem_id.value=mem_id;
		document.update.submit();
	}

	function Del(mem_id){
		document.del.mem_id.value=mem_id;
		document.del.submit();
	}

	function zipCheck(){
	url="../mall/ZipCheck.jsp?check=y";
	window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}

//product 

	function productDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}

	function productDelete(no) {
		document.del.no.value=no;
		document.del.submit();
	}

	function productUpdate(no){
		document.update.no.value=no;
		document.update.submit();
	}


//order

	function orderDetail(no){
		document.detail.no.value=no;
		document.detail.submit();	
	}
	
	function orderUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function orderDelete(form) {
		form.flag.value="delete";
		form.submit();
	}
	

//order end

// �Ϲݵ���
	function inputCheck(){
		if(document.regForm.code.value==""){
			alert("�����з��� �Է��� �ּ���.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.code.value=="0"){
			alert("�����з��� �Է��� �ּ���.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.name.value==""){
			alert("�������� �Է��� �ּ���.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.juja.value==""){
			alert("���ڸ��� �Է��� �ּ���.");
			document.regForm.juja.focus();
			return;
		}
		if(document.regForm.chool.value==""){
			alert("���ǻ縦 �Է��� �ּ���.");
			document.regForm.chool.focus();
			return;
		}
		if(document.regForm.detail.value==""){
			alert("���������� �Է��� �ּ���.");
			document.regForm.detail.focus();
			return;
		}
		if(document.regForm.day.value==""){
			alert("�������ڸ� �Է��� �ּ���.");
			document.regForm.day.focus();
			return;
		}
		if(document.regForm.stock.value==""){
			alert("���Ǻμ� �Է��� �ּ���.");
			document.regForm.stock.focus();
			return;
		}
		if(document.regForm.price.value==""){
			alert("���������� �Է��� �ּ���.");
			document.regForm.price.focus();
			return;
		}
		if(document.regForm.isbn.value==""){
			alert("ISBN �Է��� �ּ���.");
			document.regForm.isbn.focus();
			return;
		}
		document.regForm.submit();
	}



	//�Ⱓ��������
	function inputCheck2(){
		if(document.regForm.code.value==""){
			alert("�����з��� �Է��� �ּ���.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.code.value=="0"){
			alert("�����з��� �Է��� �ּ���.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.name.value==""){
			alert("�������� �Է��� �ּ���.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.juja.value==""){
			alert("���ڸ��� �Է��� �ּ���.");
			document.regForm.juja.focus();
			return;
		}
		if(document.regForm.chool.value==""){
			alert("���ǻ縦 �Է��� �ּ���.");
			document.regForm.chool.focus();
			return;
		}
		if(document.regForm.detail.value==""){
			alert("���������� �Է��� �ּ���.");
			document.regForm.detail.focus();
			return;
		}
		document.regForm.submit();
	}
