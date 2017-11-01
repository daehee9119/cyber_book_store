package mall;

import java.io.*;

public class ProductBean {

    private int    no     = 0;		//1  도서번호 (기본키, 자동증가)
    private String stock  = null;	//2  개수
    private String price  = null;	//3  가격
    private String name   = null;	//4  책이름
    private String detail = null;	//5  내용
    private String date   = null;	//6  출판일자
    private String image  = null;	//7  이미지
	private String isbn   = null;	//8  isbn
	private String juja   = null;	//9  저자
	private String chool  = null;	//10 출판사
	private String code   = null;	//11 도서분류코드


	public ProductBean() {   }	

    public int getNo() {
		if (this.no < 0)
			return 1;
		else
			return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getStock() {
        if(this.stock == null)
			return "품절";
		else
			return this.stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getPrice() {
        if(this.price == null)
			return "price null";
		else
			return this.price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getName() {
        if(this.name == null)
			return "name null";
		else
			return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        if(this.detail == null)
			return "detail null";
		else
			return this.detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDate() {
        if(this.date == null)
			return "출간예정";
		else
			return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImage() {
        if(this.image == null)
			return "image null";
		else
			return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

	public String getIsbn() {
        if(this.isbn == null)
			return "isbn null";
		else
			return this.isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

	public String getJuja() {
        if(this.juja == null)
			return "juja null";
		else
			return this.juja;
    }

    public void setJuja(String juja) {
        this.juja = juja;
    }

	public String getChool() {
        if(this.chool == null)
			return "chool null";
		else
			return this.chool;
    }

    public void setChool(String chool) {
        this.chool = chool;
    }

	public String getCode() {
        if(this.code == null)
			return "code null";
		else
			return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
