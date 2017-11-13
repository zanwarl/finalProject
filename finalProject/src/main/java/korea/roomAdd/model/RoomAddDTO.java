package korea.roomAdd.model;

public class RoomAddDTO {
		
	 private int roomidx;  //���ȣ 
	 private int useridx; 	//������ȣ
	 private String btype;  /* �� ȣ�� ��Ÿ*/
	 private String rtype; /*����ü ���ν� ���ν�*/
	 private int maxcount; //�ִ�����ο� 
	 private String addr1; //�⺻�ּ�
	 private String addr2; //���ּ�
	 private String postnum; //�����ȣ
	 private String conv; //üũ
	 private String safe; //üũ
	 private String space;  //üũ
	 private String content; //����
	 private String room_name; //���̸�
	 private int room_price; //�氡��
	 private String nodate;/*�ȵǴ³�*/ 
	 private String checkin; //üũ��
	 private String checkout; //üũ�ƿ�
	 
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
