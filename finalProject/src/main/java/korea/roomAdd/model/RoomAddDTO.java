package korea.roomAdd.model;

public class RoomAddDTO {
		
	 private int roomidx;  //방번호 
	 private int useridx; 	//유저번호
	 private String btype;  /* 집 호텔 기타*/
	 private String rtype; /*집전체 다인실 개인실*/
	 private int maxcount; //최대수용인원 
	 private String addr1; //기본주소
	 private String addr2; //상세주소
	 private String postnum; //우편번호
	 private String conv; //체크
	 private String safe; //체크
	 private String space;  //체크
	 private String content; //설명
	 private String room_name; //방이름
	 private int room_price; //방가격
	 private String nodate;/*안되는날*/ 
	 private String checkin; //체크인
	 private String checkout; //체크아웃
	 
	public RoomAddDTO() {
		super();
	}

	public RoomAddDTO(int roomidx, int useridx, String btype, String rtype, int maxcount, String addr1, String addr2,
			String postnum, String conv, String safe, String space, String content, String room_name, int room_price,
			String nodate, String checkin, String checkout) {
		super();
		this.roomidx = roomidx;
		this.useridx = useridx;
		this.btype = btype;
		this.rtype = rtype;
		this.maxcount = maxcount;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.postnum = postnum;
		this.conv = conv;
		this.safe = safe;
		this.space = space;
		this.content = content;
		this.room_name = room_name;
		this.room_price = room_price;
		this.nodate = nodate;
		this.checkin = checkin;
		this.checkout = checkout;
	}

	public int getRoomidx() {
		return roomidx;
	}

	public void setRoomidx(int roomidx) {
		this.roomidx = roomidx;
	}

	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public int getMaxcount() {
		return maxcount;
	}

	public void setMaxcount(int maxcount) {
		this.maxcount = maxcount;
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

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getConv() {
		return conv;
	}

	public void setConv(String conv) {
		this.conv = conv;
	}

	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}

	public String getSpace() {
		return space;
	}

	public void setSpace(String space) {
		this.space = space;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getNodate() {
		return nodate;
	}

	public void setNodate(String nodate) {
		this.nodate = nodate;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

}
