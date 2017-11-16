package korea.roomreq.model;

import java.util.List;
import java.util.Map;

public interface RoomreqDAO {

	// public List<RoomreqDTO> roomreqList();
	public int RoomreqAdd(RoomreqDTO rdto);

	public RoomreqDTO RoomreqOK(int idx);

	public List<RoomreqDTO> roomreqList(String userId, int cp, int listSize);

	public int roomReqTotalCnt(String userId);

	public int roomCancel(int reqIdx);

	public int paid(int reqIdx);

	public List<Map<String, Object>> myRoomList(String userId);

	public List<Map<String, Object>> roomReqInfo(int roomIdx, int mm, int yy);

}
