package korea.plan.model;

import java.util.HashMap;
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
	
	public int readNumUpdate(int idx) {
		int result = sqlMap.update("readNumUpdate", idx);
		return result;
	}

	public List<PlanDTO> planList(int cp, int pageRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cp", cp);
		map.put("pageRow", pageRow);
		List<PlanDTO> list = sqlMap.selectList("planList", map);
		return list;
	}
	
	public int totalCnt() {
		int result = sqlMap.selectOne("planTotalCnt");
		return result;
	}
	
	public int planMainWrite(PlanDTO pdto) {
		int result = sqlMap.insert("planMainWrite", pdto);
		return result;
	}
	
	public PlanDTO pdtoInfo(int idx) {
		PlanDTO pdto = sqlMap.selectOne("pdtoInfo", idx);
		return pdto;
		
	}
	
	public int lastOrder(int idx) {
		int result = sqlMap.selectOne("lastOrder", idx);
		return result;
		
	}
	public int planMainUpdate(PlanDTO pdto) {
		System.out.println("idx : " + pdto.getPlan_idx());
		int result = sqlMap.update("planMainUpdate", pdto);
		return result;
	}
	
	public int planDetailWrite(PlanDetailDTO pddto) {
		System.out.println(pddto.getPland_img());
		System.out.println(pddto.getPland_order());
		int result = sqlMap.insert("planDetailWrite", pddto);
		return result;
	}
	
	public List<PlanDetailDTO> planEditList(int pidx) {
		List<PlanDetailDTO> list = sqlMap.selectList("planEditList", pidx);
		return list;
	}
	
	public int planDetailDelete(int pidx) {
		int result = sqlMap.delete("planDetailDelete", pidx);
		return result;
	}
	
	
	public int lastSaveIdx(PlanDTO pdto) {
		System.out.println("idx : " + pdto.getPlan_writer());
		int result = sqlMap.selectOne("lastSaveIdx", pdto);
		System.out.println("result :" + result);
		return result;
	}
	
	public int myTotalCnt(int idx) {
		int result = sqlMap.selectOne("myTotalCnt", idx);
		return result;
	}
	
	public List<PlanDTO> myPlanList() {
		List<PlanDTO> list = sqlMap.selectList("myPlanList");
		return list;
	}
	
	public List<PlanDTO> myPlanList(int idx, int cp, int pageRow) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("cp", cp);
		map.put("pageRow", pageRow);
		
		List<PlanDTO> list = sqlMap.selectList("myPlanList", map);
		return list;
	}
	
	public PlanDTO planMainContent(int pidx) {
		PlanDTO pdto = sqlMap.selectOne("planMainContent", pidx);
		return pdto;
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
