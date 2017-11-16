package korea.superHost.model;

import java.util.List;

public interface SuperHostDAO {
	
	public List<SuperHostDTO> superHostList (int cp , int listSize); 
	public List<SuperHostDTO> superHostSearchList (int cp , int listSize, String id); 
	
	public int getSuperHostTotalCnt () ; 
	public int superHostSearchTotalCnt (String id ) ; 
	
	public int updateSuper (int point);
	public int deleteSuper (); 
	
	
	
}
