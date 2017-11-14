package korea.plan.model;

import java.util.List;

public interface PlanDAO {

	//일정 리스트
	public List<PlanDTO> planList();		
	//일정 리스트 + 페이징
	public List<PlanDTO> planList(int cp, int pageRow);
	//모든 일정 숫자
	public int totalCnt();
	
	
	//내 일정 리스트
	public List<PlanDTO> myPlanList();
	//내 일정 리스트 + 페이징
	public List<PlanDTO> myPlanList(int idx, int cp, int pageRow);
	//내 일정 숫자
	public int myTotalCnt(int idx);
	
	//일정 내용 보여주기
	public PlanDTO planMainContent(int pidx);
	public List<PlanDetailDTO> planDetail(int pidx);
	
	//일정 메인 테이블 작성
	public int planMainWrite(PlanDTO pdto);					
	public int planMainUpdate(PlanDTO pdto);
	public int planDetailWrite(PlanDetailDTO pddto);
	
	//최근 저장 한 마지막 idx 불러오기 + 로그인 한회원번호
	public PlanDTO lastSaveIdx(PlanDTO pdto);
	
	//일정 작성
	public int planWrite();									
	
}
