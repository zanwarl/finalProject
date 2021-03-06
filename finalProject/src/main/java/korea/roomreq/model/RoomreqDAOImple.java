package korea.roomreq.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import korea.data.model.DataDTO;

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
	public  List<Map<String, Object>> roomreqList(String userId, int cp, int listSize) {
		// TODO Auto
		Map<String, Object> map = new HashMap<String, Object>();
		int startNum = (cp - 1) * listSize + 1;
		int endNum = cp * listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userId", userId);

		 List<Map<String, Object>> list = sqlMap.selectList("roomreqList", map);
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

	public Map<String, Object> roomReqInfo2Sql(int reqidx) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("reqidx", reqidx);

		Map<String, Object> list = sqlMap.selectOne("roomReqInfo2Sql",reqidx );
		
		
		return list;
	}

	
	public String total(String roomIdx) {
		Map<String, Object> dill = new HashMap<String, Object>();
		dill.put("roomIdx",roomIdx);
		String t2 = sqlMap.selectOne("totalSql", dill);
		return t2;
	}
	public List<RoomreqDTO> total2(){
		
		List<RoomreqDTO> listt=sqlMap.selectList("total2Sql");
		 
		return listt;
	}

	public String getNoDate(int roomidx) {
		// TODO Auto-generated method stub
		String list = (String) sqlMap.selectList("getNoDateSql", roomidx).get(0);
		

		return list;
		
	}

	public List<Map<String, Object> > getBookedDate(int reqidx) {
	List<	Map<String, Object> >list =  sqlMap.selectList("getBookedDateSql", reqidx);
		
		return list; 
		
	}

	public String getRoomName(int roomidx) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getRoomNameSql", roomidx);
		
	}
	
	public List<DataDTO> Get_DataControll_getList() {
		// TODO Auto-generated method stub
		System.out.println("1111");
		List<DataDTO> list = sqlMap.selectList("getdata");
		System.out.println("22222   =" + list.size());
		
		
		return list;
	}
	
	
}