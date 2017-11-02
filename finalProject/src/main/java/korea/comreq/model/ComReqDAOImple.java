package korea.comreq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mybatis.spring.SqlSessionTemplate;

public class ComReqDAOImple implements ComReqDAO{
	private SqlSessionTemplate sqlMap;
	
	public ComReqDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int comReqWrite(ComReqDTO dto){
		System.out.println("³»¿ë: " + dto.getComreq_con());
		int result = sqlMap.insert("comReqWrite",dto);
		return result;
	}	
}
