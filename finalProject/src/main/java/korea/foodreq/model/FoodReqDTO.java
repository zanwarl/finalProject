package korea.foodreq.model;

import java.sql.Date;

public class FoodReqDTO {

	private int freq_idx; //예약idx
	private int useridx; //예약한 사람 idx
	private int f_idx; 
	private int f_count; //예약가능인원
	private Date f_reqdate;
	private String f_reqtime;
	
	public FoodReqDTO(int freq_idx, int useridx, int f_idx, int f_count, Date f_reqdate, String f_reqtime) {
		super();
		this.freq_idx = freq_idx;
		this.useridx = useridx;
		this.f_idx = f_idx;
		this.f_count = f_count;
		this.f_reqdate = f_reqdate;
		this.f_reqtime = f_reqtime;
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

	public Date getF_reqdate() {
		return f_reqdate;
	}

	public void setF_reqdate(Date f_reqdate) {
		this.f_reqdate = f_reqdate;
	}

	public String getF_reqtime() {
		return f_reqtime;
	}

	public void setF_reqtime(String f_reqtime) {
		this.f_reqtime = f_reqtime;
	}
	
	
	
	
	
	
}
