package korea.roomAdd.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import food.model.FoodDTO;
import korea.room.model.RoomAddrDTO;

public class RoomAddDAOImple implements RoomAddDAO {

	private SqlSessionTemplate sqlMap;

	public RoomAddDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int roomAdd(RoomAddDTO dto) {
		int count=sqlMap.insert("roomAddInsert",dto);
		return count;
	}

	public List<RoomJoinDTO> roomList(int cp,int listSize,String sort) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cp", cp);
		map.put("pageRow", listSize);
		map.put("sort", sort);
		List<RoomJoinDTO> list = sqlMap.selectList("roomList",map);
		return list;
	}

	public RoomAddDTO roomContent(int idx) {
		RoomAddDTO rdto = sqlMap.selectOne("roomContent",idx);
		return rdto;
	}

	public RoomAddDTO roomUpdateData(int idx) {
		RoomAddDTO rdto = sqlMap.selectOne("roomUpdateData",idx);
		return rdto;
	}

	public int roomUpdate(RoomAddDTO dto) {
		int count = sqlMap.update("roomUpdate",dto);
		return count;
	}

	public int roomDelete(int idx) {
		int count = sqlMap.delete("roomDelete",idx);
		return count;
	}

	public void fileupload(Map<String, Object> map) {
	    sqlMap.insert("rImageFile",map);

	}

	public List<ImageDTO> fileList(int idx) {
		List<ImageDTO> imageList = sqlMap.selectList("imageList",idx);
		return imageList;
	}

	public void updateFile(Map<String, Object> map ,HttpServletRequest req) throws Exception {
		
		sqlMap.delete("rImageDelete", map);
		List<Map<String,Object>> list = FileUtils.parseUpdateFileInfo(map, req);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				sqlMap.insert("rImageFile",tempMap);
			}
			else{
				sqlMap.update("rImageUpdate",tempMap);
			}
		}
	}

	public String getUserId(int useridx) {
		
		String userId =sqlMap.selectOne("getUserIdSql_room", useridx);
	return userId; 
	
	}
	
	public int totalCount() {
		return sqlMap.selectOne("totalCount");
	}
	
	
}
