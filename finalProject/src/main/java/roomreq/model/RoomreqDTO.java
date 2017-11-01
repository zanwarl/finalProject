package roomreq.model;

import java.util.*;

public class RoomreqDTO {

	private int rreq_idx;
	private int useridx;
	private int r_idx;
	private int r_count;
		
	private Date r_reqDate;
	private Date r_reqTime;
	
		
	public RoomreqDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getRreq_idx() {
		return rreq_idx;
	}
	public void setRreq_idx(int rreq_idx) {
		this.rreq_idx = rreq_idx;
	}
	public int getUseridx() {
		return useridx;
	}
	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public Date getR_reqDate() {
		return r_reqDate;
	}
	public void setR_reqDate(Date r_reqDate) {
		this.r_reqDate = r_reqDate;
	}
	public Date getR_reqTime() {
		return r_reqTime;
	}
	public void setR_reqTime(Date r_reqTime) {
		this.r_reqTime = r_reqTime;
	}
	
	public RoomreqDTO(int rreq_idx, int useridx, int r_idx, int r_count, Date r_reqDate, Date r_reqTime) {
		super();
		this.rreq_idx = rreq_idx;
		this.useridx = useridx;
		this.r_idx = r_idx;
		this.r_count = r_count;
		this.r_reqDate = r_reqDate;
		this.r_reqTime = r_reqTime;
	}

	
	
	
	
}
