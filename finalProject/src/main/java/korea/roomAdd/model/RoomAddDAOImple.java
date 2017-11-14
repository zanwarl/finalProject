package korea.roomAdd.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import food.model.FoodDTO;
import korea.room.model.RoomAddrDTO;

public class RoomAddDAOImple implements RoomAddDAO {

	private SqlSessionTemplate sqlMap;

	public RoomAddDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int roomAdd(RoomAddDTO dto) {
		int count=sqlMap.insert("roomAddInsert",dto);
		return count;
	}

	public List<RoomAddDTO> roomList() {
		List<RoomAddDTO> list = sqlMap.selectList("roomList");
		return list;
	}

	public RoomAddDTO roomContent(int idx) {
		RoomAddDTO rdto = sqlMap.selectOne("roomContent",idx);
		return rdto;
	}
}