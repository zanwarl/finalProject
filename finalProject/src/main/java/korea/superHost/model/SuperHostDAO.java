package korea.superHost.model;

import java.util.List;

public interface SuperHostDAO {
	
	public List<SuperHostDTO> superHostList (int cp , int listSize); 
	
	public int getSuperHostTotalCnt () ; 
	
	public int updateSuper (int point);
	public int deleteSuper (); 
	
	
	
}
