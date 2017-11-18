package korea.tour.model;

public class TourCodeDTO {

	private int areaCode;
	private String name;
	
	public TourCodeDTO() {
		super();
	}

	public TourCodeDTO(int areaCode, String name) {
		super();
		this.areaCode = areaCode;
		this.name = name;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
