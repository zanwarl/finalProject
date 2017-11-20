package korea.data.model;
// 통계에 대한 데이터 
// -> EJB -> POJO  
public class DataDTO {
	
	
	
	private int reqidx;        	// 예약번호.
	private String userid;	    	// 예약한 사람의 ID
	private String member_sex;		// 성별 
	private String member_birth; 	// 생일
	private int roomidx; 	    	// 예약 방 번호
	private int count; 		    	// 예약 인원수
	private String reqdate;     	// 예약한 날짜
	private String checkindate;     // 실제 예약 날짜.
	private String checkoutdate;	// 나간날짜.
	private String paid;			// 금액.
	private int total_pay; 		// 총 금액 
	
	public DataDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getReqidx() {
		return reqidx;
	}

	public void setReqidx(int reqidx) {
		this.reqidx = reqidx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public int getRoomidx() {
		return roomidx;
	}

	public void setRoomidx(int roomidx) {
		this.roomidx = roomidx;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getReqdate() {
		return reqdate;
	}

	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}

	public String getCheckindate() {
		return checkindate;
	}

	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}

	public String getCheckoutdate() {
		return checkoutdate;
	}

	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public int getTotal_pay() {
		return total_pay;
	}

	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}

	@Override
	public String toString() {
		return "DataDTO [userid=" + userid + ", member_sex=" + member_sex + ", member_birth=" + member_birth
				+ ", checkindate=" + checkindate + ", total_pay=" + total_pay + "]";
	}

	
	
}
