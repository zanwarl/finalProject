package korea.superHost.model;

public class SuperHostDTO {
	
	private int userIdx; 
	private int type;
	public SuperHostDTO(int userIdx, int type) {
		super();
		this.userIdx = userIdx;
		this.type = type;
	}
	
	public SuperHostDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	

}
