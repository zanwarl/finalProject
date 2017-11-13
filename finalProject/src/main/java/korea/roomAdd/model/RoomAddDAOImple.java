package korea.roomAdd.model;

import org.mybatis.spring.SqlSessionTemplate;

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
}
