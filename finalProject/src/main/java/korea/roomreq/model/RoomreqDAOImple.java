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
	 * public List<RoomreqDTO> roomreqList() {
	 * 
	 * List<RoomreqDTO> list = sqlMap.selectList("roomreqList"); return list; }
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
		Map<String, Object> map = new HashMap<String, Object>();
		int startNum = (cp - 1) * listSize + 1;
		int endNum = cp * listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userId", userId);

		List<RoomreqDTO> list = sqlMap.selectList("roomreqList", map);
		return list;
	}

	public int roomReqTotalCnt(String userId) {

		int res = sqlMap.selectOne("roomReqTotalCntSql", userId);
		return res;

	}

	public int roomCancel(int reqIdx) {
		// TODO A

		int res = sqlMap.update("roomCancelSql", reqIdx);
		return res;

	}

	public int paid(int reqIdx) {
		// TODO Auto-gen

		return sqlMap.update("paidSql", reqIdx);

	}

	public List<Map<String, Object>> myRoomList(String userId) {

		List<Map<String, Object>> map = sqlMap.selectList("myRoomListSql", userId);

		return map;

	}

	public List<Map<String, Object>> roomReqInfo(int roomidx) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("roomIdx", roomidx);

		List<Map<String, Object>> list = sqlMap.selectList("roomReqInfoSql", map);
		return list;

	}

}