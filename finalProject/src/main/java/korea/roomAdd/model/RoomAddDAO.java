package korea.roomAdd.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public void updateFile(Map<String, Object> map, HttpServletRequest req) throws Exception;
}
