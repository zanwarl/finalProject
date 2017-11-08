package foodreq.model;

public class FoodreqDTO {
	private int fridx;
	private int fidx;
	private String user_id;
	private String frdate;
	private String frtime;
	private int pcount;
	
	
	public FoodreqDTO() {
	
	}
	
	
	public FoodreqDTO(int fridx, int fidx, String user_id, String frdate, String frtime, int pcount) {
		super();
		this.fridx = fridx;
		this.fidx = fidx;
		this.user_id = user_id;
		this.frdate = frdate;
		this.frtime = frtime;
		this.pcount = pcount;
	}


	public int getFridx() {
		return fridx;
	}
	public void setFridx(int fridx) {
		this.fridx = fridx;
	}
	public int getFidx() {
		return fidx;
	}
	public void setFidx(int fidx) {
		this.fidx = fidx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFrdate() {
		return frdate;
	}
	public void setFrdate(String frdate) {
		this.frdate = frdate;
	}
	public String getFrtime() {
		return frtime;
	}
	public void setFrtime(String frtime) {
		this.frtime = frtime;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	
	

	
	
	
	
}
