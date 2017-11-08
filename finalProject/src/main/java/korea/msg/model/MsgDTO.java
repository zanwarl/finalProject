package korea.msg.model;

import java.sql.Date;

public class MsgDTO {


private int	idx ;
private int msgIdx ;
private int	sender ; 

private int	receiver ;
private	String content ;
private	Date writedate ;

private boolean isRead ;



public boolean isRead() {
	return isRead;
}




public void setRead(boolean isRead) {
	this.isRead = isRead;
}




public MsgDTO(int idx, int msgIdx, int sender, int receiver, String content, Date writedate, boolean isRead) {
	super();
	this.idx = idx;
	this.msgIdx = msgIdx;
	this.sender = sender;
	this.receiver = receiver;
	this.content = content;
	this.writedate = writedate;
	this.isRead = isRead;
}




public MsgDTO(int idx, int msgIdx, int sender, int receiver, String content, Date writedate) {
	
	super();
	this.idx = idx;
	this.msgIdx = msgIdx;
	this.sender = sender;
	this.receiver = receiver;
	this.content = content;
	this.writedate = writedate;
}




public int getMsgIdx() {
	return msgIdx;
}




public void setMsgIdx(int msgIdx) {
	this.msgIdx = msgIdx;
}




public MsgDTO() {
	// TODO Auto-generated constructor stub
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



}
