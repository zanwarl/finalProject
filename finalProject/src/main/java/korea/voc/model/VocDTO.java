package korea.voc.model;


import java.sql.Date;

public class VocDTO {

	
	private int idx ; 
	private String writer; 

	private String subject; 
	private String content;
	private Date writeDate;
	

	private int ref ; 
	private int lev ; 
	private int sunbun ;
	public VocDTO(int idx, String writer, String subject, String content, Date writeDate, int ref, int lev,
			int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.writeDate = writeDate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
	
	
	public VocDTO() {
		// TODO Auto-generated constructor stub
	}
	
}
