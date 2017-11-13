package korea.voc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;

public class VocDAOImple implements VocDAO {

	private SqlSessionTemplate sqlMap;

	public VocDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;

	}

	/**
	 * voc 글쓰기
	 */
	public int vocAdd(VocDTO dto) {
		int ref = getRefMax();

		dto.setRef(ref + 1);

		int count = sqlMap.insert("vocInsert", dto);
		return count;
	}

	/**
	 * 글 리스트
	 */
	public List<VocDTO> vocAllList(int cp, int listSize) {

		Map<String, Object> map = new HashMap<String, Object>();

		int startNum = (cp - 1) * listSize + 1;
		int endNum = cp * listSize;

		map.put("startNum", startNum);
		map.put("endNum", endNum);

		// map.put("cp", cp);
		// map.put("ls", listSize);

		List<VocDTO> list = sqlMap.selectList("vocAllList", map);

		return list;

	}
	public List<VocDTO> vocMyList(int cp, int listSize, String writer ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int startNum = (cp - 1) * listSize + 1;
		int endNum = cp * listSize;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("writer", writer);
		
		// map.put("cp", cp);
		// map.put("ls", listSize);
		
		List<VocDTO> list = sqlMap.selectList("vocMyList", map);
		
		return list;
		
	}

	public VocDTO vocCon(int idx) {

		VocDTO dto = sqlMap.selectOne("vocCon", idx);
		return dto;

	}

	public int getTotalCnt() {
		int res = sqlMap.selectOne("vocTotalCnt");
		return res;
	}

	public int getRefMax() {
		int res = sqlMap.selectOne("maxRef");
		return res;

	}

	public int vocReWrite(VocDTO dto
			) {

		sunbunUpdate(dto.getRef(), dto.getSunbun() + 1);
		dto.setLev(dto.getLev() + 1);
		dto.setSunbun(dto.getSunbun() + 1);
		int res = sqlMap.insert("vocInsert2", dto);
		return res;

	}

	public void sunbunUpdate(int ref, int sun) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ref", ref);
		map.put("sunbun", sun);

		sqlMap.update("newSunbun", map);

	}

	public String getMyPwd(int idx) {
		// TODO Auto-generated method stub

		String myPwd = sqlMap.selectOne("myPwd", idx);
		return myPwd;

	}

	public int vocDel(int idx) {
		int res = sqlMap.delete("vocDel", idx);

		// TODO Auto-generated method stub
		return res;

	}

	public int getTotaMylCnt(String writer) {

		return sqlMap.selectOne("vocTotalMyCnt", writer);
		
	}

	public List<VocDTO> vocNoAnsList(int cp, int listSize) {
		// TODO Auto-generated method s

		Map<String, Object> map = new HashMap<String, Object>();

		int startNum = (cp - 1) * listSize + 1;
		int endNum = cp * listSize;

		map.put("startNum", startNum);
		map.put("endNum", endNum);

		// map.put("cp", cp);
		// map.put("ls", listSize);

		List<VocDTO> list = sqlMap.selectList("noAnsVocList", map);

		return list;
	}

	public int getNoAnsTotalCnt() {
		// TODO Auto-generated 
		return sqlMap.selectOne("noAnsVocTotalCnt");
		
	}



}
