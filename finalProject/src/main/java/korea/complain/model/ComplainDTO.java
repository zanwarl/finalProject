package korea.complain.model;

import java.sql.*;

public class ComplainDTO {
	private int idx; 
	private int sender ;
	private int receiver;
	
	private String content;
	
	private Date writedate;
	
	private int res ;
	
	private Date resdate;
	private String incharge ;
	private int type;
	
	
	
	private String resContent ;
	
	
	
	
	
	public ComplainDTO(int idx, int sender, int receiver, String content, Date writedate, int res, int type) {
		super();
		this.idx = idx;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.writedate = writedate;
		this.res = res;
		this.type = type;
	}

	public String getResContent() {
		return resContent;
	}

	public void setResContent(String resContent) {
		this.resContent = resContent;
	}

	public ComplainDTO(int idx, int sender, int receiver, String content, Date writedate, int res, Date resdate,
			String incharge, int type, String resContent) {
		super();
		this.idx = idx;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.writedate = writedate;
		this.res = res;
		this.resdate = resdate;
		this.incharge = incharge;
		this.type = type;
		this.resContent = resContent;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getRes() {
		return res;
	}

	public void setRes(int res) {
		this.res = res;
	}

	public Date getResdate() {
		return resdate;
	}

	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}

	public String getIncharge() {
		return incharge;
	}

	public void setIncharge(String incharge) {
		this.incharge = incharge;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public ComplainDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ComplainDTO(int idx, int sender, int receiver, String content, Date writedate, int res, Date resdate,
			String incharge, int type) {
		super();
		this.idx = idx;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.writedate = writedate;
		this.res = res;
		this.resdate = resdate;
		this.incharge = incharge;
		this.type = type;
	}

	public ComplainDTO(String incharge, String resContent) {
		super();
		this.incharge = incharge;
		this.resContent = resContent;
	}
	
	
	
	
}
