package culreq.model;

import java.util.*;

public class CulreqDTO {

	private int crep_idx;
	private int useridx;
	private int c_idx;
	private int c_count;
	
	private Date c_reqDate;
	private Date c_reqTime;
		
	
	public CulreqDTO() {
			// TODO Auto-generated constructor stub
	}

	public CulreqDTO(int crep_idx, int useridx, int c_idx, int c_count, Date c_reqDate, Date c_reqTime) {
		super();
		this.crep_idx = crep_idx;
		this.useridx = useridx;
		this.c_idx = c_idx;
		this.c_count = c_count;
		this.c_reqDate = c_reqDate;
		this.c_reqTime = c_reqTime;
	}

	public int getCrep_idx() {
		return crep_idx;
	}

	public void setCrep_idx(int crep_idx) {
		this.crep_idx = crep_idx;
	}

	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}

	public Date getC_reqDate() {
		return c_reqDate;
	}

	public void setC_reqDate(Date c_reqDate) {
		this.c_reqDate = c_reqDate;
	}

	public Date getC_reqTime() {
		return c_reqTime;
	}

	public void setC_reqTime(Date c_reqTime) {
		this.c_reqTime = c_reqTime;
	} 
	
	
	
}
