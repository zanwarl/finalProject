package korea.roomAdd.model;

public class RoomAddDTO {

	 private int room_idx;
	 private int useridx; 
	 private String btype;  /* 집 호텔 기타*/
	 private String rtype; /*집전체 다인실 개인실*/
	 private int maxcount; 
	 private String addr1; 
	 private String addr2;
	 private String postnum;
	 private String conv;
	 private String safe;
	 private String space; 
	 private String image; 
	 private String content;
	 private String room_name;
	 private int room_price;
	 private String nodate;/*안되는날*/
	 private String userId ;
	 private int roomIdx;
	 private int count; 
	 private String reqDate;
	 private String checkinDate;
	 private String checkoutDate;
	 
	public RoomAddDTO() {
		super();
	}

	public RoomAddDTO(int room_idx, int useridx, String btype, String rtype, int maxcount, String addr1, String addr2,
			String postnum, String conv, String safe, String space, String image, String content, String room_name,
			int room_price, String nodate, String userId, int roomIdx, int count, String reqDate, String checkinDate,
			String checkoutDate) {
		super();
		this.room_idx = room_idx;
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
		this.image = image;
		this.content = content;
		this.room_name = room_name;
		this.room_price = room_price;
		this.nodate = nodate;
		this.userId = userId;
		this.roomIdx = roomIdx;
		this.count = count;
		this.reqDate = reqDate;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRoomIdx() {
		return roomIdx;
	}

	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getReqDate() {
		return reqDate;
	}

	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}

	public String getCheckinDate() {
		return checkinDate;
	}

	public void setCheckinDate(String checkinDate) {
		this.checkinDate = checkinDate;
	}

	public String getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}
	 
	
	 
}
