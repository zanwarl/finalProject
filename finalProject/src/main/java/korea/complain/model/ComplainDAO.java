package korea.complain.model;

import java.util.List;

public interface ComplainDAO {
	
	public List <ComplainDTO> complainList (int cp, int listSize); 
	public List <ComplainDTO> noAnsComplainList (int cp, int listSize); 
	
	
	
	
	public int getTOtalCnt();
	public int getTOtalCnt( boolean isAns);
	
	public ComplainDTO complainContetn ( int idx);
	
	public int complainAns (String incharge, String resContent, int idx ); 
	public int givePenalty(int idx);
	public int comReqWrite(ComplainDTO dto);

	
	
	
	
	

}
