
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

// 일반도서
	function inputCheck(){
		if(document.regForm.code.value==""){
			alert("도서분류를 입력해 주세요.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.code.value=="0"){
			alert("도서분류를 입력해 주세요.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.name.value==""){
			alert("도서명을 입력해 주세요.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.juja.value==""){
			alert("저자명을 입력해 주세요.");
			document.regForm.juja.focus();
			return;
		}
		if(document.regForm.chool.value==""){
			alert("출판사를 입력해 주세요.");
			document.regForm.chool.focus();
			return;
		}
		if(document.regForm.detail.value==""){
			alert("도서설명을 입력해 주세요.");
			document.regForm.detail.focus();
			return;
		}
		if(document.regForm.day.value==""){
			alert("출판일자를 입력해 주세요.");
			document.regForm.day.focus();
			return;
		}
		if(document.regForm.stock.value==""){
			alert("출판부수 입력해 주세요.");
			document.regForm.stock.focus();
			return;
		}
		if(document.regForm.price.value==""){
			alert("도서가격을 입력해 주세요.");
			document.regForm.price.focus();
			return;
		}
		if(document.regForm.isbn.value==""){
			alert("ISBN 입력해 주세요.");
			document.regForm.isbn.focus();
			return;
		}
		document.regForm.submit();
	}



	//출간예정도서
	function inputCheck2(){
		if(document.regForm.code.value==""){
			alert("도서분류를 입력해 주세요.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.code.value=="0"){
			alert("도서분류를 입력해 주세요.");
			document.regForm.code.focus();
			return;
		}
		if(document.regForm.name.value==""){
			alert("도서명을 입력해 주세요.");
			document.regForm.name.focus();
			return;
		}
		if(document.regForm.juja.value==""){
			alert("저자명을 입력해 주세요.");
			document.regForm.juja.focus();
			return;
		}
		if(document.regForm.chool.value==""){
			alert("출판사를 입력해 주세요.");
			document.regForm.chool.focus();
			return;
		}
		if(document.regForm.detail.value==""){
			alert("도서설명을 입력해 주세요.");
			document.regForm.detail.focus();
			return;
		}
		document.regForm.submit();
	}
