package korea.superHost.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class SuperHostDAOImple implements SuperHostDAO{

	private SqlSessionTemplate sqlMap;
	
	

	public SuperHostDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
		
	}
	

	
	
	public List<SuperHostDTO> superHostList(int cp, int listSize) {
	
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		/*map.put("max", max);
		*/
		List<SuperHostDTO> list = sqlMap.selectList("superHostSql", map);
		return list;
		
	}
	
	
	public List<SuperHostDTO> superHostSearchList(int cp, int listSize, String id) {
		
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id",id);
		/*map.put("max", max);
		 */
		List<SuperHostDTO> list = sqlMap.selectList("superHostSearchSql", map);
		return list;
		
	}

	public int getSuperHostTotalCnt() {
		int res = sqlMap.selectOne("superHostTotalCntSql");
		return res; 
	}

	
	public int superHostSearchTotalCnt(String id) {
		int res = sqlMap.selectOne("superHostTotalCntSql" , id);
		return res; 
	}
	



	public int updateSuper(int point) {
		// TODO A\
		return sqlMap.insert("updateSuperSql", point);
		
	}




	public int deleteSuper() {
		return sqlMap.delete("deleteSuperSql");
		
		
	}

}
