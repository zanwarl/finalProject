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
	

	public  List<Map<String, Object>> blackList(int cp, int listSize) {

		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<Map<String, Object>> list = sqlMap.selectList("blackListSql", map);
		return list;
		
	}

	
	
	public int getTotalCnt() {
		
		int res = sqlMap.selectOne("totalCntSql");
		return res; 
		
	}

	
	public int getSearchTotalCnt(String id) {
		
		int res = sqlMap.selectOne("totalSearchCntSql", id);
		return res; 
		
	}
	

//	public int addBlackList(int userIdx) {
//		// TODO Auto-generated method stub
//		return 0;
//	}


	public int updateBlackList() {
	//updateBlackListSql
		int res= sqlMap.insert("updateBlackListSql");
		return res ; 
		
		
		
	}


	public List<Map<String, Object>> blackSearchList(int cp, int listSize, String id) {

		
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", id);
		List<Map<String, Object>> list = sqlMap.selectList("blackListSql", map);
		return list;
	}




}
