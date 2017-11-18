package korea.roomAdd.model;

import java.util.List;
import java.util.Map;

import food.model.FoodDTO;

public interface RoomAddDAO {

	public int roomAdd(RoomAddDTO dto);
	public List<RoomJoinDTO> roomList(); 
	public RoomAddDTO roomContent(int idx);
	public List<ImageDTO> fileList(int idx);
	public RoomAddDTO roomUpdateData(int idx);
	public int roomUpdate(RoomAddDTO dto);
	public int roomDelete(int idx);
	public void fileupload(Map<String, Object> map);
}
