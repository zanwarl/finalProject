package korea.black.model;

import java.util.List;

public interface BlackDAO {
	
	public List<BlackDTO> blackList (int cp , int listSize);
	public int getTotalCnt () ; 
	public int addBlackList (int userIdx ) ; 
	
	
	
	

}
