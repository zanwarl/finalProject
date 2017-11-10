package korea.msg.model;

import java.util.List;



public interface MsgDAO {

	
	public List <MsgDTO> msgList (int cp, int listSize, String userIdx); 
	public int getTotalCnt(String userIdx);
	
//msgContentTotalCnt
	//public List <MsgDTO> msgContent (int cp, int listSize, int msgIdx); 
	public List <MsgDTO> msgContent ( int msgIdx); 
	public int getMsgContentTotalCnt(int msgIdx);
	
	
	//send msg 
	
	public boolean isFirst(String sender, String receiver);
	public int getMaxMsgIdx(String sender);
	public int getMsgIdx (String sender, String receiver );
	public int sendMsg(MsgDTO dto);
	
	public int readMsg (int msgIdx, String userIdx);
//	public String getUserId(int userIdx); 
	public int getUserIdx(String userId); 
	
	//read msg 
	
	
}
