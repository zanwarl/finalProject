package korea.room.model;

import food.model.FoodDTO;

public interface RoomDAO {
	
	
	public int roomaddr(RoomAddrDTO radto);
	public int roomIdx();
	public RoomAddrDTO roomAddrContent(int idx);
	
}
