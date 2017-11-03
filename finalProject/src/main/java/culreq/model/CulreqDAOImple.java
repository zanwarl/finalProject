package culreq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CulreqDAOImple implements CulreqDAO {

	private SqlSessionTemplate sqlMap;
	
		public CulreqDAOImple(SqlSessionTemplate sqlMap) {
			super();
			this.sqlMap = sqlMap;
		}
	
	public List<CulreqDTO> culreqList(){
	
		List <CulreqDTO> list = sqlMap.selectList("culreqList"); 
		return list;
	}

	public int culreaAdd(CulreqDTO crdto) {
		
		int count = sqlMap.insert("culreqInsert", crdto);
		return count;
	}

	public CulreqDTO culreqContent(int idx) {
	
		CulreqDTO crdto = sqlMap.selectOne("culreqContent", idx);
		return crdto;
	}
}
