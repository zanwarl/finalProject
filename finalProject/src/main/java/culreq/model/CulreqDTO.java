package culreq.model;

import java.util.*;

public class CulreqDTO {

	private int creq_idx;
	private String user_id;
	private int c_idx;
	private int c_count;
	
	private String c_reqDate;
	private String c_date;
	private String c_reqTime;
		
	
	public CulreqDTO() {
			// TODO Auto-generated constructor stub
	}


	public int getCreq_idx() {
		return creq_idx;
	}


	public void setCreq_idx(int creq_idx) {
		this.creq_idx = creq_idx;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
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


	public String getC_reqDate() {
		return c_reqDate;
	}


	public void setC_reqDate(String c_reqDate) {
		this.c_reqDate = c_reqDate;
	}


	public String getC_date() {
		return c_date;
	}


	public void setC_date(String c_date) {
		this.c_date = c_date;
	}


	public String getC_reqTime() {
		return c_reqTime;
	}


	public void setC_reqTime(String c_reqTime) {
		this.c_reqTime = c_reqTime;
	}


	public CulreqDTO(int creq_idx, String user_id, int c_idx, int c_count, String c_reqDate, String c_date,
			String c_reqTime) {
		super();
		this.creq_idx = creq_idx;
		this.user_id = user_id;
		this.c_idx = c_idx;
		this.c_count = c_count;
		this.c_reqDate = c_reqDate;
		this.c_date = c_date;
		this.c_reqTime = c_reqTime;
	}
	
	
	
	
	
}
