package korea.roomreq.model;

import java.util.List;

public interface RoomreqDAO {

	// public List<RoomreqDTO> roomreqList();
	public int RoomreqAdd(RoomreqDTO crdto);

	public RoomreqDTO RoomreqCon2(int idx);

	public List<RoomreqDTO> roomreqList(String userId, int cp, int listSize);

	public int roomReqTotalCnt(String userId);

	public int roomCancel(int reqIdx);

}
