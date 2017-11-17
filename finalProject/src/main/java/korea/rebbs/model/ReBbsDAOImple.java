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
	
	public int reBbsGetRefMax(ReBbsDTO dto){
		int count=sqlMap.selectOne("reBbsGetRefMax", dto);
		return count;
	}
	
	public int reBbsSunbunUpdate(ReBbsDTO dto){
		int count=sqlMap.update("reBbsSunbunUpdate", dto);
		return count;
	}
	
	public int reBbsReWrite(ReBbsDTO dto){
		int count=sqlMap.insert("reBbsReWrite", dto);
		return count;
	}
	
	public int reBbsDelete(){
		int count=sqlMap.delete("reBbsDelete");
		return count;
	}
	
	public int reBbsChange(ReBbsDTO dto){
		int count=sqlMap.update("reBbsChange", dto);
		return count;
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
