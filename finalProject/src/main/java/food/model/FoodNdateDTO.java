package food.model;

import java.sql.Date;

public class FoodNdateDTO {
	
	private int fidx;
	private String fndate;
	
	public FoodNdateDTO() {
		super();
	}
	
	public FoodNdateDTO(int fidx, String fndate) {
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
	public String getFndate() {
		return fndate;
	}
	public void setFndate(String fndate) {
		this.fndate = fndate;
	}
	
}
