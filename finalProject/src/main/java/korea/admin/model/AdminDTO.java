package korea.admin.model;

public class AdminDTO {
	

	private int idx; 
	private String pwd;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public AdminDTO(int idx, String pwd) {
		super();
		this.idx = idx;
		this.pwd = pwd;
	} 

	
	public AdminDTO() {
		// TODO Auto-generated constructor stub
	}
	
}
