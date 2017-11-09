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
	
	public PlanDTO lastSaveIdx(PlanDTO pdto) {
		pdto = sqlMap.selectOne("lastSaveIdx", pdto);
		return pdto;
	}
	
	public List<PlanDTO> myPlanList() {
		List<PlanDTO> list = sqlMap.selectList("myPlanList");
		return list;
	}
	
	public List<PlanDTO> myPlanList(int cp, int pageRow) {
		return null;
	}
	
	public List<PlanDetailDTO> planDetail(int pidx) {
		System.out.println("-------");
		List<PlanDetailDTO> pddto = sqlMap.selectList("planDetail", pidx);
		return pddto;
	}

	public int planWrite() {
		return 0;
	}
}
