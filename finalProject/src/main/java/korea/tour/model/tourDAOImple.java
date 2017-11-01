package korea.tour.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class tourDAOImple implements tourDAO {

	private SqlSessionTemplate sqlMap;

	public tourDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int tourcmtWrite(tourCmtDTO cmtdto) {
		System.out.println("코드번호 " + cmtdto.getTour_cmt_pidx());
		int result = sqlMap.insert("tourCmtWrite", cmtdto);
		return result;
	}
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx) {
		//System.out.println("sql : " + tour_cmt_pidx);
		List<tourCmtDTO> list = sqlMap.selectList("tourCmtList", tour_cmt_pidx);
		return list;
	}
}
