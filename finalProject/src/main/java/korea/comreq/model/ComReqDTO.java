package korea.comreq.model;

import java.sql.Date;

public class ComReqDTO {
	private int comreq_idx;
	private int sender_idx;
	private int recever_idx;
	private String comreq_con;
	private Date comreq_date;
	private int comreq_cate;
	
	
	public ComReqDTO() {
		
	}


	public ComReqDTO(int comreq_idx, int sender_idx, int recever_idx, String comreq_con, Date comreq_date,
			int comreq_cate) {
		super();
		this.comreq_idx = comreq_idx;
		this.sender_idx = sender_idx;
		this.recever_idx = recever_idx;
		this.comreq_con = comreq_con;
		this.comreq_date = comreq_date;
		this.comreq_cate = comreq_cate;
	}



	public int getComreq_idx() {
		return comreq_idx;
	}


	public void setComreq_idx(int comreq_idx) {
		this.comreq_idx = comreq_idx;
	}


	public int getSender_idx() {
		return sender_idx;
	}


	public void setSender_idx(int sender_idx) {
		this.sender_idx = sender_idx;
	}


	public int getRecever_idx() {
		return recever_idx;
	}


	public void setRecever_idx(int recever_idx) {
		this.recever_idx = recever_idx;
	}


	public String getComreq_con() {
		return comreq_con;
	}


	public void setComreq_con(String comreq_con) {
		this.comreq_con = comreq_con;
	}


	public Date getComreq_date() {
		return comreq_date;
	}


	public void setComreq_date(Date comreq_date) {
		this.comreq_date = comreq_date;
	}


	public int getComreq_cate() {
		return comreq_cate;
	}


	public void setComreq_cate(int comreq_cate) {
		this.comreq_cate = comreq_cate;
	}
	
	
	

}


