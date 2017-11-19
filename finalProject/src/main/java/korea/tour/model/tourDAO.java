package korea.tour.model;

import java.util.List;

public interface tourDAO {
	
	//?��?���? ?���? ?��?��
	public int tourcmtWrite(tourCmtDTO cmtdto);
	//?��?���? ?���? ?��?��
	public int tourcmtDel(int idx);		
	//?��?�� ?��?���??�� ?���? ?��
	public int totalCnt(String contentId);		
	//?��?���? ?���? 리스?��
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx, int cp, int pageRow);	
	
	public String areaCode(int areCode);
	
	public List<SigunguDTO> sigunguCode();
	
	public String sigunguName(int areaCode, String sigunguCode);
	
	
	
}
