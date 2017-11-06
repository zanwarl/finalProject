package korea.msg.model;

import java.util.List;



public interface MsgDAO {

	
	public List <MsgDTO> msgList (int cp, int listSize, int userIdx); 
	public int getTotalCnt(int userIdx);
	
//msgContentTotalCnt
	public List <MsgDTO> msgContent (int cp, int listSize, int msgIdx); 
	public int getMsgContentTotalCnt(int msgIdx);
}
