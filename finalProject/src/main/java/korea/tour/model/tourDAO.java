package korea.tour.model;

import java.util.List;

public interface tourDAO {
	
	//?—¬?–‰ì§? ?Œ“ê¸? ?‘?„±
	public int tourcmtWrite(tourCmtDTO cmtdto);
	//?—¬?–‰ì§? ?Œ“ê¸? ?‚­? œ
	public int tourcmtDel(int idx);		
	//?•´?‹¹ ?—¬?–‰ì§??˜ ?Œ“ê¸? ?ˆ˜
	public int totalCnt(String contentId);		
	//?—¬?–‰ì§? ?Œ“ê¸? ë¦¬ìŠ¤?Š¸
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx, int cp, int pageRow);	
	
}
