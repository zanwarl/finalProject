package korea.roomAdd.model;

import java.util.List;

import food.model.FoodDTO;

public interface RoomAddDAO {

	public int roomAdd(RoomAddDTO dto);
	public List<RoomAddDTO> roomList(); 
	public RoomAddDTO roomContent(int idx);
	public RoomAddDTO roomUpdateData(int idx);
	public int roomUpdate(RoomAddDTO dto);
	public int roomDelete(int idx);
}
