package korea.room.model;

import org.mybatis.spring.SqlSessionTemplate;

public class RoomDAOImple implements RoomDAO {

	private SqlSessionTemplate sqlMap;

	public RoomDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int roomaddr(RoomAddrDTO radto) {
		int count = sqlMap.insert("roomAddrInsert",radto);
		return count;
	}

	public int roomIdx() {
		int roomidx = sqlMap.selectOne("selectIdx");
		return roomidx;
	}

	public RoomAddrDTO roomAddrContent(int idx) {
		RoomAddrDTO radto = sqlMap.selectOne("roomAddrContent",idx);
		return radto;
	}

}
