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


	public int getTotalCnt(int userIdx) {	
		//System.out.println(userIdx);
		//userIdx
		int res = sqlMap.selectOne("msgTotalCnt", userIdx);
	//	System.out.println("res"+res);
		return res ;
	}

}
