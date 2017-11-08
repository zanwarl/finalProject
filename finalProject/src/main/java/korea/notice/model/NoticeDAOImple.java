package korea.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import korea.black.model.BlackDTO;


public class NoticeDAOImple implements NoticeDAO{
	private SqlSessionTemplate sqlMap;

	   public NoticeDAOImple(SqlSessionTemplate sqlMap) {
	      super();
	      this.sqlMap = sqlMap;
	   }

	public int noticeWrite(NoticeDTO dto) {
		int res = sqlMap.insert("noticeWriteSql", dto);
		
		return res ;
	}

	public List<NoticeDTO> noticeList(int cp, int listSize) {
		Map<String, Object>map = new HashMap<String, Object>();
		int startNum = (cp -1)* listSize+1;
		int endNum = cp*listSize;	
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<NoticeDTO> list = sqlMap.selectList("noticeListSql", map);
		return list;
	}

	public int getTotalCnt() {	
		int res = sqlMap.selectOne("noticeTotalCnt");
		System.out.println(res);
	return res; 
	
	
	}

	public int noticeUpdate(NoticeDTO dto ) {
		int res = sqlMap.update("noticeUpdateSql", dto );
		return res ; 
		}
	   

	
}
