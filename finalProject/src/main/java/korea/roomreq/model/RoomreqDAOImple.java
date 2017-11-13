package korea.roomreq.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class RoomreqDAOImple implements RoomreqDAO {

	private SqlSessionTemplate sqlMap;

	public RoomreqDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
/*
	public List<RoomreqDTO> roomreqList() {

		List<RoomreqDTO> list = sqlMap.selectList("roomreqList");
		return list;
	}
*/
	public int RoomreqAdd(RoomreqDTO rdto) {

		int count = sqlMap.insert("roomreqInsert", rdto);
		return count;
	}

	public RoomreqDTO RoomreqOK(int idx) {

		RoomreqDTO rdto = sqlMap.selectOne("roomReqOK", idx);
		return rdto;
	}
	
	
	
	///////////////////////////
	public List<RoomreqDTO> roomreqList(String userId, int cp, int listSize) {
		// TODO Auto
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userId", userId);
		
		List<RoomreqDTO> list = sqlMap.selectList("roomreqList", map);
		return list;
	}
	public int roomReqTotalCnt(String userId) {
	
		
		int res = sqlMap.selectOne("roomReqTotalCntSql", userId);
		return res ; 
		
	}
	public int roomCancel(int reqIdx) {
		// TODO A

		int res = sqlMap.update("roomCancelSql", reqIdx);
		return res; 
		
	}
}