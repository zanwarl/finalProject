package korea.plan.model;

import java.util.Date;

//map이나 dto 이용하면 되는데 dto를 권장한다고 함. 그래서 join용 dto 만듦
public class PlanMainDetailDTO {

	//일정 DTO
	private int plan_idx;
	private String plan_subject;
	private String plan_writer;
	private Date plan_writeDate;
	private String plan_explain;
	private String plan_name;
	private String plan_place;
	private String plan_season;
	private String plan_public;
	private String plan_start;
	private String plan_end;
	private int plan_readnum;
	private String plan_file;
	
	//일정 상세 내용 DTO
	private int pland_idx;			//인덱스
	private int pland_pidx;			//부모 테이블 idx
	private int pland_day;			//여행 일자(1..2..3..)
	private String pland_memo;		//메모
	private int pland_order;		//일정 노출 순서(변경 가능)
	private String pland_subject; 	//여행지 이름
	private String pland_typeid;	//여행지 api contenttypeid
	private String pland_code;		//여행지 api contentid
	private String pland_img;
	
	public PlanMainDetailDTO() {
		super();
	}
	
	public PlanMainDetailDTO(int plan_idx, String plan_subject, String plan_writer, Date plan_writeDate,
			String plan_explain, String plan_name, String plan_place, String plan_season, String plan_public,
			String plan_start, String plan_end, int plan_readnum, String plan_file, int pland_idx, int pland_pidx,
			int pland_day, String pland_memo, int pland_order, String pland_subject, String pland_typeid,
			String pland_code, String pland_img) {
		super();
		this.plan_idx = plan_idx;
		this.plan_subject = plan_subject;
		this.plan_writer = plan_writer;
		this.plan_writeDate = plan_writeDate;
		this.plan_explain = plan_explain;
		this.plan_name = plan_name;
		this.plan_place = plan_place;
		this.plan_season = plan_season;
		this.plan_public = plan_public;
		this.plan_start = plan_start;
		this.plan_end = plan_end;
		this.plan_readnum = plan_readnum;
		this.plan_file = plan_file;
		this.pland_idx = pland_idx;
		this.pland_pidx = pland_pidx;
		this.pland_day = pland_day;
		this.pland_memo = pland_memo;
		this.pland_order = pland_order;
		this.pland_subject = pland_subject;
		this.pland_typeid = pland_typeid;
		this.pland_code = pland_code;
		this.pland_img = pland_img;
	}


	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public String getPlan_subject() {
		return plan_subject;
	}
	public void setPlan_subject(String plan_subject) {
		this.plan_subject = plan_subject;
	}
	public String getPlan_writer() {
		return plan_writer;
	}
	public void setPlan_writer(String plan_writer) {
		this.plan_writer = plan_writer;
	}
	public Date getPlan_writeDate() {
		return plan_writeDate;
	}
	public void setPlan_writeDate(Date plan_writeDate) {
		this.plan_writeDate = plan_writeDate;
	}
	public String getPlan_explain() {
		return plan_explain;
	}
	public void setPlan_explain(String plan_explain) {
		this.plan_explain = plan_explain;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getPlan_place() {
		return plan_place;
	}
	public void setPlan_place(String plan_place) {
		this.plan_place = plan_place;
	}
	public String getPlan_season() {
		return plan_season;
	}
	public void setPlan_season(String plan_season) {
		this.plan_season = plan_season;
	}
	public String getPlan_public() {
		return plan_public;
	}
	public void setPlan_public(String plan_public) {
		this.plan_public = plan_public;
	}
	public String getPlan_start() {
		return plan_start;
	}
	public void setPlan_start(String plan_start) {
		this.plan_start = plan_start;
	}
	public String getPlan_end() {
		return plan_end;
	}
	public void setPlan_end(String plan_end) {
		this.plan_end = plan_end;
	}
	public int getPlan_readnum() {
		return plan_readnum;
	}
	public void setPlan_readnum(int plan_readnum) {
		this.plan_readnum = plan_readnum;
	}
	public String getPlan_file() {
		return plan_file;
	}
	public void setPlan_file(String plan_file) {
		this.plan_file = plan_file;
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
	public String getPland_subject() {
		return pland_subject;
	}
	public void setPland_subject(String pland_subject) {
		this.pland_subject = pland_subject;
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
	public String getPland_img() {
		return pland_img;
	}
	public void setPland_img(String pland_img) {
		this.pland_img = pland_img;
	}
}
