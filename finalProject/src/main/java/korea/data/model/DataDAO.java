package korea.data.model;

import java.util.List;
import java.util.Map;

public interface DataDAO {

	// 1. Get_DataControll_List 모든 데이터 List 가지고 오기 -> Option all    -> 전체 
	// 														Select -> Target Data 에 대한 통계.
	
/*	List<DataDTO> Get_DataControll_List(String Target_Option);*/
		
	List<DataDTO> Get_DataControll_getList();

	
	
}
