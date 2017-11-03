package korea.plan.model;

import java.util.List;

public interface PlanDAO {

	
	public List<PlanDTO> planList(int cp, int pageRow);		//일정 리스트
	public int planWrite();									//일정 작성
	
}
