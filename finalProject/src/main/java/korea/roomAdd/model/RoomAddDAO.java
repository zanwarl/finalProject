package korea.roomAdd.model;

import java.util.List;

import food.model.FoodDTO;

public interface RoomAddDAO {

	public int roomAdd(RoomAddDTO dto);
	public List<RoomAddDTO> roomList(); 
}
