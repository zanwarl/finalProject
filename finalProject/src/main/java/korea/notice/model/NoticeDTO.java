package korea.notice.model;

import java.sql.Date;

public class NoticeDTO {


private int	noticeIdx ;

private	String content ;
private	String title ;
private	String writer ;
private	Date writedate ;




public NoticeDTO(int noticeIdx, String content, String title) {
	super();
	this.noticeIdx = noticeIdx;
	this.content = content;
	this.title = title;
}

public NoticeDTO() {
	// TODO Auto-generated constructor stub
}

public NoticeDTO(int noticeIdx, String content, String title, String writer, Date writedate) {
	super();
	this.noticeIdx = noticeIdx;
	this.content = content;
	this.title = title;
	this.writer = writer;
	this.writedate = writedate;
}
public int getNoticeIdx() {
	return noticeIdx;
}
public void setNoticeIdx(int noticeIdx) {
	this.noticeIdx = noticeIdx;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public Date getWritedate() {
	return writedate;
}
public void setWritedate(Date writedate) {
	this.writedate = writedate;
}


}
