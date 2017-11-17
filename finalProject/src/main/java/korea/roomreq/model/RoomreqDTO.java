package korea.roomreq.model;

public class RoomreqDTO {

	private int reqidx;
	private String userid;
	private int roomidx;
	private int count;
	private int paid;
		
	private String reqDate;
	private String checkindate;
	private String checkoutdate;		
	private int total_pay;
	
	
		
	public RoomreqDTO() {
		super();
	
	}

	public RoomreqDTO(int reqidx, String userid, int roomidx, int count, int paid, String reqDate, String checkindate,
			String checkoutdate, int total_pay) {
		super();
		this.reqidx = reqidx;
		this.userid = userid;
		this.roomidx = roomidx;
		this.count = count;
		this.paid = paid;
		this.reqDate = reqDate;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
		this.total_pay = total_pay;
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
	public int getPaid() {
		return paid;
	}
	public void setPaid(int paid) {
		this.paid = paid;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
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
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	
	
	

	
	
}
