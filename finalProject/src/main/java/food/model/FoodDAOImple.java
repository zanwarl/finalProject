package food.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FoodDAOImple implements FoodDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FoodDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/**�젅�뒪�넗�옉 �벑濡�*/
	public int foodAdd(FoodDTO fdto) {
		
		int count = sqlMap.insert("foodInsert", fdto);
		return count;
	}

	public List<FoodDTO> foodList() {
		List<FoodDTO> list = sqlMap.selectList("foodList");
		return list;
	}

	public FoodDTO foodContent(int idx) {
		FoodDTO fdto = sqlMap.selectOne("foodContent",idx);
		return fdto;
	}

}
