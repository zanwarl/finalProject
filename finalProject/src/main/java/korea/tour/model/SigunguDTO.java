package korea.tour.model;

public class SigunguDTO {

	private int areaCode;
	private int sigunguCode;
	private String name;
	private String img;
	private int readnum;
	
	public SigunguDTO() {
		super();
	}
	
	public SigunguDTO(int areaCode, int sigunguCode, String name, String img, int readnum) {
		super();
		this.areaCode = areaCode;
		this.sigunguCode = sigunguCode;
		this.name = name;
		this.img = img;
		this.readnum = readnum;
	}

	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	public int getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
}
