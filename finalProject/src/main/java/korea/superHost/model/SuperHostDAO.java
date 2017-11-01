package korea.superHost.model;

import java.util.List;

public interface SuperHostDAO {
	
	public List<SuperHostDTO> superHostList (int cp , int listSize, int type );
	public int getSuperHostTotalCnt () ; 
	
}
