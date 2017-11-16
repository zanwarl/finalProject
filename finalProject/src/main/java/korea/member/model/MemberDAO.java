package korea.member.model;

import korea.member.model.MemberDTO;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public boolean memberSelect(String userid);
	public String getUserEmail (int memIdx);
	public boolean login (String member_id, String member_pwd);

	public MemberDTO getUserInfo (int idx);
	
	
	//2017.11.13.�솉二쇱쁺
	public MemberDTO memberInfo(String member_id);
	
	public int memberUpdate(MemberDTO dto);
	public String idSeach(String member_name, String member_email);
	public String pwdSeach(String member_id, String member_email);
}
