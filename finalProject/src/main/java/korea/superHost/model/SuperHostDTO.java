package korea.superHost.model;

public class SuperHostDTO {

	private int rank;
	private String member_id;
	private int member_host_grade;

	public SuperHostDTO(int rank, String member_id, int member_host_grade) {
		super();
		this.rank = rank;
		this.member_id = member_id;
		this.member_host_grade = member_host_grade;
	}

	public SuperHostDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getMember_host_grade() {
		return member_host_grade;
	}

	public void setMember_host_grade(int member_host_grade) {
		this.member_host_grade = member_host_grade;
	}

}
