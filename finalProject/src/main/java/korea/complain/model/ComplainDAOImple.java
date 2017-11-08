package korea.complain.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import korea.member.model.MemberDTO;

public class ComplainDAOImple implements ComplainDAO {
	

	private SqlSessionTemplate sqlMap;

	   public ComplainDAOImple(SqlSessionTemplate sqlMap) {
	      super();
	      this.sqlMap = sqlMap;
	   }
	   


	public List<ComplainDTO> complainList(int cp, int listSize) {
	
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List <ComplainDTO> list = sqlMap.selectList("complainList", map);
		return list; 
		
		
		
	}


	public int getTOtalCnt() {
		
		int res = sqlMap.selectOne("totalCnt");
		return res ;
		
		
	}


	public ComplainDTO complainContetn(int idx) {
		
		ComplainDTO dto = sqlMap.selectOne("complainContent", idx);
		return dto ; 
		
		
		
		
	}



	public int complainAns(String incharge, String resContent, int idx) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("incharge", incharge);
		map.put("resContent", resContent);
		map.put("idx", idx);

		int res = sqlMap.update("complainUpdateSql", map);
		return res; 
	}



	public int givePenalty(int idx) {
		int res = sqlMap.update("givePenaltySql", idx);
		return res ; 
		
		
		
	}

	public int comReqWrite(ComplainDTO dto){
	//	System.out.println("³»¿ë: " + dto.getContent());
		int result = sqlMap.insert("comReqWrite",dto);
		return result;
	}



	public List<ComplainDTO> noAnsComplainList(int cp, int listSize) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List <ComplainDTO> list = sqlMap.selectList("noAnsComplainList", map);
		return list; 
		
		
		
		
		//noAnsComplainList
	
	}



	public int getTOtalCnt(boolean isAns) {
		// TODO A
		int res = sqlMap.selectOne("noAnsTotalCnt");
		return res ;
		//noAnsTotalCnt
	}



	public List<ComplainDTO> searchComplainList(int cp, int listSize, int key, String val) {
	
		Map<String, Object> map = new HashMap<String, Object>();
	 	
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		 
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		
		
		map.put("val", key==1?Integer.parseInt(val):val );
		
	
		String sql = "";
		
		
		switch (key) {
		case 1:
			sql = "searchIdxSql";
			
			
			
			break;
		case 2:
			sql = "searchSenderSql";
			
			break;
		case 3:
			sql = "searchReceiverSql";
			
			
			break;
		case 4:
			sql ="searchInchargeSql";
			
			break;

		default:
			break;
		}
		
		
		List <ComplainDTO> list = sqlMap.selectList(sql, map);
		return list; 
		
		
	}



	public int getTOtalCnt(int key, String val) {
		
		String sql ="";
		
		
		switch (key) {
		case 1:
			sql = "searchIdxTotalCnt";
			
			
			break;
		case 2:
			sql = "searchSenderTotalCnt";
			
			break;
		case 3:
			sql = "searchReceiverTotalCnt";
			
			
			break;
		case 4:
			sql ="searchInchargeTotalCnt";
			
			break;

		default:
			break;
		}
		
		int res = sqlMap.selectOne(sql, key==1 ?Integer.parseInt(val):val);
		return res ;
		
	}



	public MemberDTO getUserInfo(int member_idx) {
		
		//getUserInfoSql
		MemberDTO dto = sqlMap.selectOne("getUserInfoSql", member_idx); 
		return dto ; 
		
	}	




}
