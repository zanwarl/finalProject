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
	 private String roomname; //���̸�
	 private int roomprice; //�氡��
	 private String nodate;/*�ȵǴ³�*/ 
	 private String checkin; //üũ��
	 private String checkout; //üũ�ƿ�
	 
	public RoomAddDTO() {
		super();
	}
	
	public RoomAddDTO(int roomidx, int useridx, String btype, String rtype, int maxcount, String addr1, String addr2,
			String postnum, String conv, String safe, String space, String content, String roomname, int roomprice,
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
		this.roomname = roomname;
		this.roomprice = roomprice;
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

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public int getRoomprice() {
		return roomprice;
	}

	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
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
