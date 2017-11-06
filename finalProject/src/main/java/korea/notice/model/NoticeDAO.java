package korea.notice.model;

import java.util.List;



public interface NoticeDAO {
	

	public int noticeWrite (NoticeDTO dto ); 
	
	public List<NoticeDTO> noticeList(int cp, int listSize);
	
//	public List<NoticeDTO> NoticeDTO dto  (int cp , int listSize);
	public int getTotalCnt () ; 
	public int noticeUpdate (NoticeDTO dto );
	
	
}
