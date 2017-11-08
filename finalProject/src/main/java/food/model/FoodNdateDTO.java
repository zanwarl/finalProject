package food.model;

import java.sql.Date;

public class FoodNdateDTO {
	
	private int fidx;
	private Date fndate;
	
	public FoodNdateDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodNdateDTO(int fidx, Date fndate) {
		super();
		this.fidx = fidx;
		this.fndate = fndate;
	}
	public int getFidx() {
		return fidx;
	}
	public void setFidx(int fidx) {
		this.fidx = fidx;
	}
	public Date getFndate() {
		return fndate;
	}
	public void setFndate(Date fndate) {
		this.fndate = fndate;
	}
	
	
	
}
