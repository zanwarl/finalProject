package foodreq.model;

import java.util.*;

public class FoodreqDTO {
	private int freq_idx;
	private int useridx;
	private int f_idx;
	private int f_count;
	
	private Date f_reqDate;
	private Date f_reqTime;
	
	
	
	public FoodreqDTO() {
		// TODO Auto-generated constructor stub
	}

	public FoodreqDTO(int freq_idx, int useridx, int f_idx, int f_count, Date f_reqDate, Date f_reqTime) {
		super();
		this.freq_idx = freq_idx;
		this.useridx = useridx;
		this.f_idx = f_idx;
		this.f_count = f_count;
		this.f_reqDate = f_reqDate;
		this.f_reqTime = f_reqTime;
	}

	public int getFreq_idx() {
		return freq_idx;
	}

	public void setFreq_idx(int freq_idx) {
		this.freq_idx = freq_idx;
	}

	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public int getF_idx() {
		return f_idx;
	}

	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}

	public int getF_count() {
		return f_count;
	}

	public void setF_count(int f_count) {
		this.f_count = f_count;
	}

	public Date getF_reqDate() {
		return f_reqDate;
	}

	public void setF_reqDate(Date f_reqDate) {
		this.f_reqDate = f_reqDate;
	}

	public Date getF_reqTime() {
		return f_reqTime;
	}

	public void setF_reqTime(Date f_reqTime) {
		this.f_reqTime = f_reqTime;
	}

	
	
	
	
}
