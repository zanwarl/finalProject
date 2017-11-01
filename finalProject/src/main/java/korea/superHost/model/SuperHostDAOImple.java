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
	
	
	public List<SuperHostDTO> superHostList(int cp, int listSize, int type) {
	
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("type", type);
		
		List<SuperHostDTO> list = sqlMap.selectList("superHostSql", map);
		return list;
		
	}

	public int getSuperHostTotalCnt() {
		int res = sqlMap.selectOne("superHostTotalCntSql");
		return res; 
	}

}
