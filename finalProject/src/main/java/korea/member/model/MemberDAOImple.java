package korea.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import korea.member.model.MemberDTO;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	} 

	public int memberJoin(MemberDTO dto) {
		int count=sqlMap.insert("memberInsert", dto);
		return count;
	}

	public boolean memberSelect(String userid) {
		String count=sqlMap.selectOne("memberSelect",userid);
		if(count==null || count.equals("")) {
			return false;
		}else {
			return true;
		}
	}

	public String getUserEmail(int memIdx) {
		String res = sqlMap.selectOne("getUserEmail", memIdx);
		
		return res; 
		
	}

	public boolean login(String member_id, String member_pwd) {
		
		List<Object> pwd = sqlMap.selectList("memberloginSql", member_id);
		if (pwd.get(0).equals(member_pwd)){
			System.out.println("true");
			return true;
		}
		else return false; 
		
	}

	public MemberDTO getUserInfo(int idx) {
		//   <select id="getUserInfoSql" parameterType="int" resultMap="korea.member.model.MemberDTO">
		MemberDTO dto =sqlMap.selectOne("getUserInfoSql", idx);
		return dto ; 
	}
	
	//2017.11.13 �솉二쇱쁺
	public MemberDTO memberInfo(String member_id) {
		MemberDTO mdto = sqlMap.selectOne("memberInfo", member_id);
		return mdto;
	}
	
	public int memberUpdate(MemberDTO dto) {
		int count=sqlMap.update("memberUpdate", dto);
		return count;
	}
	
	public String idSeach(String member_name, String member_email) {
		
		Map<String, Object> iseach = new HashMap<String, Object>();
		iseach.put("member_name",member_name);
		iseach.put("member_email",member_email);
		String listt = sqlMap.selectOne("idSeachSql", iseach);
		return listt;
	}

	public String pwdSeach(String member_id, String member_email) {
		
		Map<String, Object> pseach = new HashMap<String, Object>();
		pseach.put("member_id",member_id);
		pseach.put("member_email",member_email);
		String list2 = sqlMap.selectOne("pwdSeachSql", pseach);
		return list2;
	}

	public List<Map<String, Object>> myRoomListProfile(String userId) {
		
		return sqlMap.selectList("myRoomListProfileSql", userId);
		
	}

	public List<Map<String, Object>> myPlanListProfile(String userId) {
		// TODO Auto-

		return sqlMap.selectList("myPlanListProfileSql", userId);
		
		
	}

	public boolean isBlack(String userid) {
		 List<Map<String, Object>> list = sqlMap.selectList("isBLackListSql", userid);
		 if (list.size()==0){
			 //no blacklist 
			 return false; 
		 }
		 else {
//			 blacklsist
			 return true; 
		 }
	
		
		
	}


}
