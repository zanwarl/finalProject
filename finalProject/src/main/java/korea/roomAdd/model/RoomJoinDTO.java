package korea.roomAdd.model;

public class RoomJoinDTO {
	 private int roomidx;  
	 private int useridx; 	
	 private String roomname;
	 private String filename;
	 
	 public RoomJoinDTO() {
		// TODO Auto-generated constructor stub
	}
	 
	public RoomJoinDTO(int roomidx, int useridx, String roomname, String filename) {
		super();
		this.roomidx = roomidx;
		this.useridx = useridx;
		this.roomname = roomname;
		this.filename = filename;
	}

	
	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	 
	 
}
