package food.model;

public class FoodDTO {
	
	private int fidx;
	private String fname;
	private String user_id;
	private int fpay;
	private String opentime;
	private String closetime;
	private String postcode;
	private String addr1;
	private String addr2;
	private int pcount;
	private String fcontent;

	
	public FoodDTO() {
		// TODO Auto-generated constructor stub
	}


	public FoodDTO(int fidx, String fname, String user_id, int fpay, String opentime, String closetime, String postcode,
			String addr1, String addr2, int pcount, String fcontent) {
		super();
		this.fidx = fidx;
		this.fname = fname;
		this.user_id = user_id;
		this.fpay = fpay;
		this.opentime = opentime;
		this.closetime = closetime;
		this.postcode = postcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.pcount = pcount;
		this.fcontent = fcontent;
	}


	public int getFidx() {
		return fidx;
	}


	public void setFidx(int fidx) {
		this.fidx = fidx;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getFpay() {
		return fpay;
	}


	public void setFpay(int fpay) {
		this.fpay = fpay;
	}


	public String getOpentime() {
		return opentime;
	}


	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}


	public String getClosetime() {
		return closetime;
	}


	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}


	public String getPostcode() {
		return postcode;
	}


	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public int getPcount() {
		return pcount;
	}


	public void setPcount(int pcount) {
		this.pcount = pcount;
	}


	public String getFcontent() {
		return fcontent;
	}


	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	
	
	
}
