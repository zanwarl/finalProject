package korea.roomreq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class RoomreqDAOImple implements RoomreqDAO {

	private SqlSessionTemplate sqlMap;

	public RoomreqDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<RoomreqDTO> roomreqList() {

		List<RoomreqDTO> list = sqlMap.selectList("roomreqList");
		return list;
	}

	public int RoomreqAdd(RoomreqDTO crdto) {

		int count = sqlMap.insert("roomreqInsert", crdto);
		return count;
	}

	public RoomreqDTO RoomreqCon2(int idx) {

		RoomreqDTO crdto = sqlMap.selectOne("roomreqCon2", idx);
		return crdto;
	}
}