package food.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

public class FoodDAOImple implements FoodDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FoodDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/**�젅�뒪�넗�옉 �벑濡�*/
	public int foodAdd(FoodDTO fdto) {
		
		 int count = sqlMap.insert("foodInsert",fdto);
		 return count;
	}
	
	public List<FoodDTO> foodList() {
		List<FoodDTO> list = sqlMap.selectList("foodList");
		return list;
	}

	public FoodDTO foodContent(int idx) {
		FoodDTO fdto = sqlMap.selectOne("foodContent",idx);
		return fdto;
	}

	
	
	public List<FoodTimeDTO> foodTime(int fidx) {
		System.out.println("-----------");
		List<FoodTimeDTO> list = sqlMap.selectList("foodTime", fidx);
		return list;
	}

	
	public HashMap<String, FoodNdateDTO> foodNdate(int fidx) {
		List<FoodNdateDTO> list = sqlMap.selectList("foodNdate",fidx);
		
		HashMap<String, FoodNdateDTO> holiday = new HashMap<String, FoodNdateDTO>();
		
		for(FoodNdateDTO i : list) {
			holiday.put(i.getFndate(),i);
		}
		
		/*Iterator<String> it = holiday.keySet().iterator();  // 키 집합 자료를 가진 이터레이터 객체 생성

		System.out.println(holiday.toString());  // 해시맵 내용 출력 
		System.out.println(holiday.keySet());   // 해시맵 키 출력
		
		while(it.hasNext()){                 // 다음 자료가 더 있는지 검사
			FoodNdateDTO s = holiday.get(it.next());  // 자료를 순서대로 스트링 변수에 저장 
			//System.out.println(s);        // 자료를 출력
		}		*/
		
		return holiday;
	}
	
	public void fImageUpload(String oName, String fimagename, long fileSize) {
		 HashMap<String, Object> hm = new HashMap<String, Object>();
		    hm.put("originalfileName", oName);
		    hm.put("saveFileName", fimagename);
		    hm.put("fileSize", fileSize);
		     
		    sqlMap.insert("uploadFile",hm);
	}

	public List<FoodTimeDTO> foodList(int fidx) {
		// TODO Auto-generated method stub
		return null;
	}




}
