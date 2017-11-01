package korea.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO{
	
	
	
	private SqlSessionTemplate sqlMap;
	
	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	
	}

	public boolean login(int idx, String userPwd) {
		
		List<Object> pwd = sqlMap.selectList("loginSql", idx);
		if (pwd.get(0).equals(userPwd)){
			return true;
		}
		else return false; 
		
	}
	

	
	
}
