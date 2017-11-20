package korea.data.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import food.model.FoodDTO;

public class DataDAOImple implements DataDAO {

	private SqlSessionTemplate sqlMap;

	public DataDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/*public List<DataDTO> Get_DataControll_List(String Target_Option) {
		// TODO Auto-generated method stub
		
		Map<String, String > map = new HashMap<String, String>();
		map.put("Target_Option", Target_Option);
	
		List<DataDTO> reservation_List = sqlMap.selectList("get_hosting_add_roomnum", map);
		
		return sqlMap.selectList("Get_DataControll_List", reservation_List);
		
	}

	
	public List<Map<String, Object>> dataList(String userId) {

		List<Map<String, Object>> map = sqlMap.selectList("dataControll", userId);

		return map;

	}

	public List<Map<String, Object>> myRoomList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}*/

	public List<DataDTO> Get_DataControll_getList() {
		// TODO Auto-generated method stub
		System.out.println("1111");
		List<DataDTO> list = sqlMap.selectList("getdata");
		System.out.println("22222   =" + list.size());
		
		
		return list;
	}
	
	
}
