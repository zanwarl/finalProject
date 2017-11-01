package korea.complain.model;

import java.util.List;

public interface ComplainDAO {
	public List <ComplainDTO> complainList (int cp, int listSize); 
	public int getTOtalCnt();
	public ComplainDTO complainContetn ( int idx);
	
	public int complainAns (String incharge, String resContent, int idx ); 
	
	
	
	
	
	

}
