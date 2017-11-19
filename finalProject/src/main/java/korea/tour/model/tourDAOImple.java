package korea.tour.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class tourDAOImple implements tourDAO {

	private SqlSessionTemplate sqlMap;

	public tourDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int tourcmtWrite(tourCmtDTO cmtdto) {
		int result = sqlMap.insert("tourCmtWrite", cmtdto);
		return result;
	}
	
	public int tourcmtDel(int idx) {
		int result = sqlMap.delete("tourCmtDel", idx);
		return result;
	}
	
	public int totalCnt(String contentId) {
		int result = sqlMap.selectOne("tourTotalCnt", contentId);
		return result;
	}
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx, int cp, int pageRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tour_cmt_pidx", tour_cmt_pidx);
		map.put("cp", cp);
		map.put("pageRow", pageRow);
		
		List<tourCmtDTO> list = sqlMap.selectList("tourCmtList", map);
		return list;
	}
	
	public String areaCode(int areaCode) {
		String result = sqlMap.selectOne("areaCode", areaCode);
		return result;
	}
}
