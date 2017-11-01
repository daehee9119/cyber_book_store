<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%! public String name_replace(String line, String oldString, String newString) { 
        int index = 0; 
        while ((index = line.indexOf(oldString, index)) >= 0) { 
            line = line.substring(0, index) + newString + line.substring(index + oldString.length()); 
            index += newString.length(); 
        } 
        return line; 
    } 	
%>    
<%
	InputStream in= null;
	OutputStream os	= null;
	File file= null;
	boolean skip= false;
	String client= "";
try {
	String fname1 		= "";
	String fname2 		= "";
	String fname       	= "";
			
	fname 	= request.getParameter("file_name1"); 
	fname1   = Utility.han(fname);
	String path = request.getRealPath("/") + "updown/" ;

	try{
		file= new File(path, fname1);
		in= new FileInputStream(file);
	}catch(FileNotFoundException fe){
		skip= true;
	}
	fname2 = name_replace(fname1,"+"," ");
	//fname2 = java.net.URLEncoder.encode(fname2,"MS949");//CP949

	response.reset() ;
	client= request.getHeader("User-Agent");
	response.setContentType("application/x-msdownload;");
	response.setHeader("Content-Description", "JSP Generated Data");

	if(!skip){
		if(client.indexOf("MSIE 5.5") != -1){
			response.setHeader("Content-Type", "doesn/matter; charset=euc-kr");
			response.setHeader("Content-Disposition", "filename="+fname2+";");
		}else{
			response.setHeader("Content-Type", "application/octet-stream; charset=euc-kr");
			response.setHeader ("Content-Disposition", "attachment; filename="+fname2+";");
		}
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader ("Content-Length", ""+file.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		os= response.getOutputStream();
		byte b[]= new byte[4096]; 
		int leng= 0;
		while( (leng = in.read(b)) > 0 ){
			os.write(b,0,leng);
		}
	}else{
		out.println("<script language='javascript'>");
		out.println("alert('File Downloading Fail !!');");
		out.println("history.back();");
		out.println("</script>");
	}

	}catch(Exception e) {
		System.out.println(e);
	}
	finally {
		if(in != null) in.close();
		if(os != null) os.close();
	}
%>