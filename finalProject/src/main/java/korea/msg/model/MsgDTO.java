package korea.msg.model;


public class MsgDTO {

	private int idx;
	private int msgIdx;
	private String sender;

	private String receiver;
	private String content;
	private String writedate;

	private int isRead;

	public MsgDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMsgIdx() {
		return msgIdx;
	}

	public void setMsgIdx(int msgIdx) {
		this.msgIdx = msgIdx;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MsgDTO(int idx, int msgIdx, String sender, String receiver, String content, String writedate, int isRead) {
		super();
		this.idx = idx;
		this.msgIdx = msgIdx;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.writedate = writedate;
		this.isRead = isRead;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

}
