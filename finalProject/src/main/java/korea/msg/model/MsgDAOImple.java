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
	   

	public List<MsgDTO> msgList(int cp, int listSize, String userIdx) {
	
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userIdx", userIdx);
		
		List <MsgDTO> list = sqlMap.selectList("msgListSql", map);
		return list; 
		
		
	}
	
	public List<MsgDTO> msgContent( int msgIdx) {
		
/*		Map<String, Object> map = new HashMap<String, Object>();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("msgIdx", msgIdx);
		*/
		List <MsgDTO> list = sqlMap.selectList("msgContentSql", msgIdx);
		return list; 
		
		
	}


	public int getTotalCnt(String userIdx) {	
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
	
	public boolean isFirst(String sender, String receiver) {
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
	public int getMaxMsgIdx(String sender) {
		
		
		
		int res = (Integer)sqlMap.selectList("getMaxMsgIdxSql", sender).get(0)==null ? 1:  (Integer)sqlMap.selectList("getMaxMsgIdxSql", sender).get(0)	;
		return res+1; 
		
	}
	
	//기존 대화 번호 찾는거 
	public int getMsgIdx (String sender, String receiver ){
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
	
	
	public int readMsg(int msgIdx, String userIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("msgIdx", msgIdx);
		map.put("userIdx", userIdx);

		int res = sqlMap.update("readMsgSql", map);
		return res;

	}

	/*
	 * public String getUserId(int userIdx) { // TODO Auto-generated method stub
	 * 
	 * String userId = sqlMap.selectOne("getUserIdSql", userIdx); return userId;
	 * 
	 * }
	 */
	
	public int getUserIdx(String userId) {
		// TODO Auto-generated method stub
		
		int userIdx = sqlMap.selectOne("getUserIdxSql", userId);
		return userIdx; 
		
	}

}
