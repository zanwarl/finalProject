package korea.voc.model;

import java.util.List;

public interface VocDAO {
	   public int vocAdd(VocDTO dto);	
	   public List<VocDTO> vocAllList(int cp, int listSize);
	   public List<VocDTO> vocMyList(int cp, int listSize, String writer );
	   public List<VocDTO> vocNoAnsList(int cp, int listSize );
	   public VocDTO vocCon (int idx); 
	   public int getTotalCnt ();
	   public int getNoAnsTotalCnt ();
	   public int getTotaMylCnt (String writer );
	   public int getRefMax ();
	   public int vocReWrite (VocDTO dto);
	   public void sunbunUpdate (int ref , int sun);
	   public String getMyPwd (int idx);
	   public int vocDel (int idx);
	   
	   
	   
	   
	   
	
}
