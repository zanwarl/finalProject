package korea.msg.model;

import java.util.List;



public interface MsgDAO {

	
	public List <MsgDTO> msgList (int cp, int listSize, int userIdx); 
	public int getTotalCnt(int userIdx);
	
//msgContentTotalCnt
	public List <MsgDTO> msgContent (int cp, int listSize, int msgIdx); 
	public int getMsgContentTotalCnt(int msgIdx);
	
	
	//send msg 
	
	public boolean isFirst(int sender, int receiver);
	public int getMaxMsgIdx(int sender);
	public int getMsgIdx (int sender, int receiver );
	public int sendMsg(MsgDTO dto);
	
	
	
}
