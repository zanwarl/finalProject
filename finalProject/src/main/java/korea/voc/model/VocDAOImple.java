package korea.voc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class VocDAOImple implements VocDAO{

	
	private SqlSessionTemplate sqlMap;
	
	public VocDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	
	}

	public int vocWrite(VocDTO dto) {
		return  sqlMap.insert("vocWriteSql", dto);
			
	}

	public int vocReWrite(VocDTO dto) {
		
		vocTurnUpdate(dto.getRef(), dto.getTurn()+1);
		
		
		return sqlMap.insert("vocReWriteSql", dto);
	}

	public int getMyVocTotalCnt(String writer) {
		return sqlMap.selectOne("getMyVocTotalCntSql");
		
	}

	public int getVocTotalCnt() {

		return sqlMap.selectOne("getVocTotalCntSql");
	}

	public int getNoAnsVocTotalCnt() {
		return sqlMap.selectOne("getNoAnsVocTotalCntSql");
	}

	public List<VocDTO> myVocList(String writer, int cp, int listSize) {
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("writer", writer);
		
		return sqlMap.selectList("myVocListSql", map);
		
			
	}

	public int vocUpdate(String title, String content, int idx) {
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("idx", idx);
		
		return sqlMap.insert("vocUpdateSql", map);
	}

	public int vodDel(int idx) {
		return sqlMap.delete("vodDelSql", idx);
		
	}

	public VocDTO vocCon(int idx) {
		
		return sqlMap.selectOne("vocConSql", idx);
		
	}

	public int getVocMaxRef() {
		
		return sqlMap.selectOne("getVocMaxRefSql");
		
	}

	public List<VocDTO> vocList(int cp, int listSize) {
		
		
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		
		return sqlMap.selectList("vocListSql", map);
	}

	public List<VocDTO> vocNoAnsList(int cp, int listSize) {
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		
		return sqlMap.selectList("vocNoAnsListSql", map);
	}

	public int vocTurnUpdate(int ref, int turn ) {
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("ref", ref);
		map.put("turn", turn);
		return sqlMap.update("vocTurnUpdateSql", map);
		
	}

	
}
