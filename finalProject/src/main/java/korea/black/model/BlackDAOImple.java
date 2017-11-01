package korea.black.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class BlackDAOImple implements BlackDAO{

	private SqlSessionTemplate sqlMap;
	
	public BlackDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
		
	}
	

	public List<BlackDTO> blackList(int cp, int listSize) {

		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<BlackDTO> list = sqlMap.selectList("blackListSql", map);
		return list;
		
	}

	public int getTotalCnt() {
		
		int res = sqlMap.selectOne("totalCntSql");
		return res; 
		
	}


	public int addBlackList(int userIdx) {
		// TODO Auto-generated method stub
		return 0;
	}

}
