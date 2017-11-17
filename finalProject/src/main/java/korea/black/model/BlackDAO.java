package korea.black.model;

import java.util.List;
import java.util.Map;

public interface BlackDAO {
	
	public List<Map<String, Object>> blackList (int cp , int listSize);
	public List<Map<String, Object>> blackSearchList (int cp , int listSize, String id);
	public int getTotalCnt () ; 
	public int getSearchTotalCnt (String id) ; 
	//public int addBlackList (int userIdx ) ; 
	public int updateBlackList () ; 
	


	

}
