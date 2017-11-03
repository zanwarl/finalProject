package korea.member.model;

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

	

}
