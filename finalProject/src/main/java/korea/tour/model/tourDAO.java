package korea.tour.model;

import java.util.List;

public interface tourDAO {
	
	//여행지 댓글 작성
	public int tourcmtWrite(tourCmtDTO cmtdto);
	//여행지 댓글 삭제
	public int tourcmtDel(int idx);		
	//해당 여행지의 댓글 수
	public int totalCnt(String contentId);		
	//여행지 댓글 리스트
	public List<tourCmtDTO> tourcmtList(String tour_cmt_pidx, int cp, int pageRow);	
	
}
