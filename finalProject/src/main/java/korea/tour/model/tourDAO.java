package korea.tour.model;

import java.util.List;

public interface tourDAO {
	
	//?¬?μ§? ?κΈ? ??±
	public int tourcmtWrite(tourCmtDTO cmtdto);
	//?¬?μ§? ?κΈ? ?­? 
	public int tourcmtDel(int idx);		
	//?΄?Ή ?¬?μ§?? ?κΈ? ?
	public int totalCnt(String contentId);		
	//?¬?μ§? ?κΈ? λ¦¬μ€?Έ
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx, int cp, int pageRow);	
	
}
