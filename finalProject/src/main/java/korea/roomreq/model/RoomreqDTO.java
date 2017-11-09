package korea.roomreq.model;

import java.util.*;

public class RoomreqDTO {

	private int reqidx;
	private String userid;
	private int roomidx;
	private int count;
		
	private String reqDate;
	private String checkindate;
	private String checkoutdate;			
	
	public RoomreqDTO() {
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


	public RoomreqDTO(int reqidx, String userid, int roomidx, int count, String reqDate, String checkindate,
			String checkoutdate) {
		super();
		this.reqidx = reqidx;
		this.userid = userid;
		this.roomidx = roomidx;
		this.count = count;
		this.reqDate = reqDate;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
	}
	

	
	
}
