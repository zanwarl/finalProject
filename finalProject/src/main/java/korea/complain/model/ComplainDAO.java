package korea.complain.model;

import java.util.List;

import korea.member.model.MemberDTO;

public interface ComplainDAO {
	
	public List <ComplainDTO> complainList (int cp, int listSize); 
	public List <ComplainDTO> noAnsComplainList (int cp, int listSize); 
	public List <ComplainDTO> searchComplainList (int cp, int listSize, int key, String val); 
	
	
	
	
	public int getTOtalCnt();
	public int getTOtalCnt( boolean isAns);
	public int getTOtalCnt(int key, String val );
	
	public ComplainDTO complainContetn ( int idx);
	
	public int complainAns (String incharge, String resContent, int idx ); 
	public int givePenalty(int idx);
	public int comReqWrite(ComplainDTO dto);

	public MemberDTO getUserInfo (int member_idx ); 
	
	
	
	

}
