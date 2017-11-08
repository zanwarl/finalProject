package korea.plan.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import korea.tour.model.tourCmtDTO;

public class PlanDAOImple implements PlanDAO {
	
	private SqlSessionTemplate sqlMap;


	public PlanDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<PlanDTO> planList() {
		List<PlanDTO> list = sqlMap.selectList("planList");
		return list;
	}

	public List<PlanDTO> planList(int cp, int pageRow) {
		return null;
	}
	
	public int planMainWrite(PlanDTO pdto) {
		int result = sqlMap.insert("planMainWrite", pdto);
		return result;
	}
	

	public int planWrite() {
		return 0;
	}
}
