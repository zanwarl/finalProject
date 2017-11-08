package korea.member.model;

import java.util.List;

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
			return true;
		}
		else return false; 
		
	}

	public MemberDTO getUserInfo(int idx) {
		//   <select id="getUserInfoSql" parameterType="int" resultMap="korea.member.model.MemberDTO">
		MemberDTO dto =sqlMap.selectOne("getUserInfoSql", idx);
		return dto ; 
	}


}
