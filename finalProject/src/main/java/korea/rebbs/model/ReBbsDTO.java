package korea.rebbs.model;

import java.sql.*;

public class ReBbsDTO {

	private int rebbs_idx;
	private String writer;
	private String pwd;
	private String subject;
	private String content;
	private Date writedate;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	
	public ReBbsDTO() {
		super();
	}

	public ReBbsDTO(int rebbs_idx, String writer, String pwd, String subject, String content, Date writedate,
			int readnum, int ref, int lev, int sunbun) {
		super();
		this.rebbs_idx = rebbs_idx;
		this.writer = writer;
		this.pwd = pwd;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getRebbs_idx() {
		return rebbs_idx;
	}

	public void setRebbs_idx(int rebbs_idx) {
		this.rebbs_idx = rebbs_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	
	
}
