package food.model;

public class FoodTimeDTO {

	private int fidx;
	private String ftime;
	
	public FoodTimeDTO() {
		super();
	}

	public FoodTimeDTO(int fidx, String ftime) {
		super();
		this.fidx = fidx;
		this.ftime = ftime;
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}
}
