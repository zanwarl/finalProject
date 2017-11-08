package korea.member.model;

import korea.member.model.MemberDTO;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public boolean memberSelect(String userid);
	public String getUserEmail (int memIdx);
	public boolean login (String member_id, String member_pwd);

}
