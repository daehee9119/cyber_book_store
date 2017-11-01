package com.test.bean;

import com.test.util.Utility;
import com.test.util.ServerInfo;
import javax.servlet.http.*;
import java.io.*;
import java.util.Enumeration;
import java.lang.reflect.*;


//���� ���ε� �� - MultipartRequest =======================
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//========================================================

public class Board_Entity {
	private Utility util;

	//����Ʈ ������ ======================================
	public Board_Entity() {
		 this.util = new Utility();
	}
	
	//�⺻ ���� ���� =====================================
	private String cmd = "";    //��û�۾� ����	
	
	private int 	num; 		//�Խù� �Ϸù�ȣ
	private String 	reg_name;	//�ۼ��� 
	private String 	title;		//���� 
	private String 	content;	//����
	private String 	file_name1;	//�����̸�1
	private int 	hit_cnt;	//��ȸ��
	private int 	doc_group;	//�۱׷�
	private int 	doc_pos;	//������ 
	private int 	doc_step;	//���� 
	private String 	ip_num; 	//IP�ּ� 
	private String 	reg_date;	//�����
	private String 	state;		//���� 
	
	//�۾��� ���� ��Ÿ �������� ========================
	private String 	queryStr;	//queryString �� ���
	private int 	p_num;		//�θ�۹�ȣ
	private String f_del1;		//����1
	
	//setter �޼ҵ� ���� =================================
	public void setCmd(String cmd) { 	this.cmd = cmd;	}
	public void setNum(int num) {	this.num = num;	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFile_name1(String file_name1) {
		this.file_name1 = file_name1;
	}
	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}
	public void setDoc_group(int doc_group) {
		this.doc_group = doc_group;
	}
	public void setDoc_pos(int doc_pos) {
		this.doc_pos = doc_pos;
	}
	public void setDoc_step(int doc_step) {
		this.doc_step = doc_step;
	}
	public void setIp_num(String ip_num) {
		this.ip_num = ip_num;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public void setState(String state) {
		this.state = state;
	}
	//----------------------------------------------------	
	public void setQueryStr(String str) {
		this.queryStr = str;
	}
	public void setP_num(int p_num) { 
		this.p_num = p_num;
	}	
	public void setF_del1(String f_del1) {
		this.f_del1 = f_del1;
	}

	
	//getter �޼ҵ� ���� =================================
	public String getCmd() {
		if(this.cmd == null) {	return ""; }
		else {	return this.cmd; }
	}
	public int getNum() {
		return this.num;
	}
	public String getReg_name( boolean han_yn ) { //����Ÿ�� �ѱ��� ���
		if(this.reg_name == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.reg_name);}
			else { return this.reg_name;	}
		}
	}
	public String getTitle( boolean han_yn ) { 
		if(this.title == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.title);}
			else { return this.title;	}
		}
	}	
	public String getContent( boolean han_yn ) { 
		if(this.content == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.content);}
			else {	return this.content;	}
		}
	}
	public String getFile_name1( boolean han_yn ) { 
		if(this.file_name1 == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.file_name1);}
			else { return this.file_name1;	}
		}
	}
	public int getHit_cnt() {	return this.hit_cnt;	}
	public int getDoc_group() {	return this.doc_group;	}
	public int getDoc_pos() {	return this.doc_pos;	}
	public int getDoc_step() {	return this.doc_step;	}
	public String  getIp_num(){	return this.ip_num;		}
	public String  getReg_date() {return this.reg_date;	}
	public String  getState() {	return this.state;		}

	//----------------------------------------------------
	public String getQueryStr(boolean han_yn) {
		if(this.queryStr == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.queryStr);}
			else{	 return this.queryStr;	}
		}
	}
	public int getP_num() {		return this.p_num;		}
	public String getF_del1() {	return this.f_del1;		}
	
			
	//====================================================
	//Ŭ���̾�Ʈ ��û�� �޾Ƽ� ��ü�� �����ϴ� �޼ҵ�(���� ���ε� �뵵)
	public void setParser(HttpServletRequest request ) throws Exception {
		try{
			String file_path  = request.getRealPath("/") + "updown/" ;//"d:\\home\\Ch09\\freeboard\\attach_file\\";
	 		MultipartRequest up = new MultipartRequest(request, file_path , 10*1024*1024 ,"euc-kr", new DefaultFileRenamePolicy());//new DefaultFileRenamePolicy());
 				
			this.cmd		= up.getParameter("cmd");
					    
		    this.num 		= Utility.numChk(up.getParameter("num"), 0);		//�Ϸù�ȣ(number)
	 		this.reg_name	= up.getParameter("reg_name"); 						//�ۼ���
			this.title	    = up.getParameter("title"); 						//����
			this.content	= up.getParameter("content");						//����
			this.hit_cnt	= Utility.numChk(up.getParameter("hit_cnt"),0); 	//��ȸ��(number)
			this.doc_group	= Utility.numChk(up.getParameter("doc_group"),0);	//�۱׷�(number)
			this.doc_pos    = Utility.numChk(up.getParameter("doc_pos"),0); 	//����ġ(number)
			this.doc_step 	= Utility.numChk(up.getParameter("doc_step"),0);	//���� (number)
			this.ip_num	    = up.getParameter("ip_num"); 						//ip�ּ�
			this.reg_date	= up.getParameter("reg_date"); 						//�����
			this.state		= up.getParameter("state");							//����
		
			this.queryStr	= up.getParameter("queryStr");						//queryString 
			this.p_num	   	= Utility.numChk(up.getParameter("p_num"),0);		//�θ�۹�ȣ 
			this.f_del1		= up.getParameter("f_del1");						//���� 1

			for (Enumeration e = up.getFileNames();e.hasMoreElements();) {
				 String strName = (String)e.nextElement();
				 if("file_name1".equals(strName)){// ÷������ 1
				 	File f = up.getFile(strName);
					if(f != null ) {
						this.file_name1= f.getName();
					}
	 			 }				 
			}//end_while
				 		
		 }//end_try
		 catch(Exception e){throw e;}
	}
	
	//====================================================	
	//��ü�� ���� ������ �ܺο��� ����� �� �ְ� ��� �޼ҵ� ����
	public String toInfoString() {
		StringBuffer buf = new StringBuffer();
		String[] fields = getPropertyNames();
		for(int i=0; i<fields.length; i++) {
			try {
				buf.append("<br>\n");
				buf.append(fields[i] + "=" + getValue(fields[i]));
				buf.append("\n<br>\n");
			}catch(Exception e) {	}
		}
		return buf.toString();
	}

	//��ü�� ������ �ִ� �޹��ʵ� ���� ���
	public String[] getPropertyNames() {
		Field[] fs = getClass().getDeclaredFields();
		String[] names = new String[fs.length];
		for(int i=0; i<fs.length; i++) {
			names[i] = fs[i].getName();	
		}
		return names;
	}

	//��ü�� ������ �ִ� �޹��ʵ��� �� ���
	public Object getValue(String prop_name) throws Exception {
		Field fd = getClass().getDeclaredField(prop_name);
		try {
			return fd.get(this);
		}catch(Exception e) {
			throw new Exception(e.toString() + "\nprop_name=" + prop_name);
		}
	}
	//----------------------------------------------------	
}
	