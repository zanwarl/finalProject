package korea.rebbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReBbsDAOImple implements ReBbsDAO {

	private SqlSessionTemplate sqlMap;

	public ReBbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int reBbsWrite(ReBbsDTO dto){
		int count=sqlMap.insert("reBbsWrite", dto);
		return count;
	}
	
	public List<ReBbsDTO> reBbsList(int cp, int ls){
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		
		List<ReBbsDTO> list=sqlMap.selectList("reBbsList", data);
		System.out.println("**list** : "+list);
		return list;
	}
	
	public ReBbsDTO reBbsContent(int idx){
		ReBbsDTO dto=sqlMap.selectOne("reBbsContent", idx);
		return dto;
	}
	
	public int getTotalCnt(){
		int count=sqlMap.selectOne("reBbsTotalCnt");
		return count==0?1:count;
	}
}
