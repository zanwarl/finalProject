package korea.plan.model;

//일정 세부사항(일정 건당 insert 되는 테이블
public class PlanDetailDTO {

	private int pland_idx;			//인덱스
	private int pland_pidx;			//부모 테이블 idx
	private int pland_day;			//여행 일자(1..2..3..)
	private String pland_memo;		//메모
	private int pland_order;		//일정 노출 순서(변경 가능)
	private String pland_typeid;	//여행지 api contenttypeid
	private String pland_code;		//여행지 api contentid
	
	public PlanDetailDTO() {
		super();
	}

	public PlanDetailDTO(int pland_idx, int pland_pidx, int pland_day, String pland_memo, int pland_order,
			String pland_typeid, String pland_code) {
		super();
		this.pland_idx = pland_idx;
		this.pland_pidx = pland_pidx;
		this.pland_day = pland_day;
		this.pland_memo = pland_memo;
		this.pland_order = pland_order;
		this.pland_typeid = pland_typeid;
		this.pland_code = pland_code;
	}

	public int getPland_idx() {
		return pland_idx;
	}

	public void setPland_idx(int pland_idx) {
		this.pland_idx = pland_idx;
	}

	public int getPland_pidx() {
		return pland_pidx;
	}

	public void setPland_pidx(int pland_pidx) {
		this.pland_pidx = pland_pidx;
	}

	public int getPland_day() {
		return pland_day;
	}

	public void setPland_day(int pland_day) {
		this.pland_day = pland_day;
	}

	public String getPland_memo() {
		return pland_memo;
	}

	public void setPland_memo(String pland_memo) {
		this.pland_memo = pland_memo;
	}

	public int getPland_order() {
		return pland_order;
	}

	public void setPland_order(int pland_order) {
		this.pland_order = pland_order;
	}

	public String getPland_typeid() {
		return pland_typeid;
	}

	public void setPland_typeid(String pland_typeid) {
		this.pland_typeid = pland_typeid;
	}

	public String getPland_code() {
		return pland_code;
	}

	public void setPland_code(String pland_code) {
		this.pland_code = pland_code;
	}
	
}
