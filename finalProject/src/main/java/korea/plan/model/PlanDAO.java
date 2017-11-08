package korea.plan.model;

import java.util.List;

public interface PlanDAO {

	//일정 리스트
	public List<PlanDTO> planList();		
	//일정 리스트 + 페이징
	public List<PlanDTO> planList(int cp, int pageRow);		
	//일정 메인 테이블 작성
	public int planMainWrite(PlanDTO pdto);					
	
	
	
	//일정 작성
	public int planWrite();									
	
}
