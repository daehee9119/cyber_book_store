package mall;

import java.io.*;

public class Juja_Data {
	
	private int num;
	private String name; 
	private String email;
	private String phone;
	private String content1;
	private String content2;
	private String content3;
	
  public Juja_Data() {   } //디폴트 생성자
  // Setter Method =========================
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}


////////////////////////////////////////////////////////////////////

	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getContent1() {
		return content1;
	}
	public String getContent2() {
		return content2;
	}
	public String getContent3() {
		return content3;
	}
}
