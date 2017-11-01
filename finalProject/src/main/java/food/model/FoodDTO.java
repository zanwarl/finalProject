package food.model;

public class FoodDTO {
	private int useridx;
	private String fname;
	private String opentime;
	private String closetime;
	private String addr1;
	private String addr2;
	private String image;
	private int foodpay;
	private String content;
	private String abletime;
	private int pcount;
	private int score;
	
	public FoodDTO() {
		// TODO Auto-generated constructor stub
	}

	public FoodDTO(int useridx, String fname, String opentime, String closetime, String addr1, String addr2,
			String image, int foodpay, String content, String abletime, int pcount, int score) {
		super();
		this.useridx = useridx;
		this.fname = fname;
		this.opentime = opentime;
		this.closetime = closetime;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.image = image;
		this.foodpay = foodpay;
		this.content = content;
		this.abletime = abletime;
		this.pcount = pcount;
		this.score = score;
	}



	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getFoodpay() {
		return foodpay;
	}

	public void setFoodpay(int foodpay) {
		this.foodpay = foodpay;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAbletime() {
		return abletime;
	}

	public void setAbletime(String abletime) {
		this.abletime = abletime;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
