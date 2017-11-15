package korea.rebbs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface ReBbsDAO {

	public int reBbsWrite(ReBbsDTO dto);
	public List<ReBbsDTO> reBbsList(int cp, int ls);
	public ReBbsDTO reBbsContent(int idx);
	public int getTotalCnt();
}
