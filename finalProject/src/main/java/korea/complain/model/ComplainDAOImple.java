package korea.complain.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ComplainDAOImple implements ComplainDAO {
	

	private SqlSessionTemplate sqlMap;

	   public ComplainDAOImple(SqlSessionTemplate sqlMap) {
	      super();
	      this.sqlMap = sqlMap;
	   }
	   


	public List<ComplainDTO> complainList(int cp, int listSize) {
	
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List <ComplainDTO> list = sqlMap.selectList("complainList", map);
		return list; 
		
		
		
	}


	public int getTOtalCnt() {
		
		int res = sqlMap.selectOne("totalCnt");
		return res ;
		
		
	}


	public ComplainDTO complainContetn(int idx) {
		
		ComplainDTO dto = sqlMap.selectOne("complainContent", idx);
		return dto ; 
		
		
		
		
	}



	public int complainAns(String incharge, String resContent, int idx) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("incharge", incharge);
		map.put("resContent", resContent);
		map.put("idx", idx);

		int res = sqlMap.update("complainUpdateSql", map);
		return res; 
	}



}
