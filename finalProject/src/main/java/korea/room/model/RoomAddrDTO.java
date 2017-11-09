package korea.room.model;

public class RoomAddrDTO {
	 private int room_idx;
	 private String addr1;
	 private String addr2;
	 private String postnum;
	 
	 public RoomAddrDTO() {
		// TODO Auto-generated constructor stub
	}

	public RoomAddrDTO(int room_idx, String addr1, String addr2, String postnum) {
		super();
		this.room_idx = room_idx;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.postnum = postnum;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
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
	 
	
}