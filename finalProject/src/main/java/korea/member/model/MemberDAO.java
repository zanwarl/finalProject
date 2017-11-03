package korea.member.model;

import korea.member.model.MemberDTO;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public boolean memberSelect(String userid);
}
