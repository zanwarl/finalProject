package korea.msg.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class MsgDAOImple implements MsgDAO{
	private SqlSessionTemplate sqlMap;

	   public MsgDAOImple(SqlSessionTemplate sqlMap) {
	      super();
	      this.sqlMap = sqlMap;
	   }
	   

	public List<MsgDTO> msgList(int cp, int listSize, int userIdx) {
	
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userIdx", userIdx);
		
		List <MsgDTO> list = sqlMap.selectList("msgListSql", map);
		return list; 
		
		
	}
	
	public List<MsgDTO> msgContent(int cp, int listSize, int msgIdx) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("msgIdx", msgIdx);
		
		List <MsgDTO> list = sqlMap.selectList("msgContentSql", map);
		return list; 
		
		
	}


	public int getTotalCnt(int userIdx) {	
		//System.out.println(userIdx);
		//userIdx
		int res = sqlMap.selectOne("msgTotalCnt", userIdx);
	//	System.out.println("res"+res);
		return res ;
	}


	public int getMsgContentTotalCnt(int msgIdx) {
		// TODO Auto-generated method stub
		//msgContentTotalCnt
		//	public int getTotalCnt(int userIdx);

		int res = sqlMap.selectOne("msgContentTotalCnt", msgIdx);
		
		return res ; 
		
	}

	// send msg 
	
	public boolean isFirst(int sender, int receiver) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("sender",sender );
		map.put("receiver", receiver);
		
		int res =  sqlMap.selectOne("isFirstSql", map );
		
		if (res>0){
			return true ; 
			//이미 대화가 있음
		}
		else return false; 
		//지금 대화 없음 
		
	
	}


	//새로운 대화 번호를 찾는 것 
	public int getMaxMsgIdx(int sender) {
		
		int res = sqlMap.selectOne("getMaxMsgIdxSql", sender)	;
		return res+1; 
		
	}
	//기존 대화 번호 찾는거 
	public int getMsgIdx (int sender, int receiver ){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("sender",sender );
		map.put("receiver", receiver);
		
		int res =  sqlMap.selectOne("getMsgIdxSql", map );
		return res;
		
		
	}


	public int sendMsg(MsgDTO dto) {
	
		int res = sqlMap.insert("sendMsgSql", dto);
		return res; 
		
		
		
	}
	
	
	
	public int readMsg(int msgIdx ){
		int res = sqlMap.update("readMsgSql", msgIdx);
		return res; 
		
	}

}
