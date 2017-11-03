package korea.plan.model;

import java.sql.Date;

public class PlanDTO {

	private int plan_idx;			//인덱스
	private String plan_subject;	//제목
	private String writer;			//작성자
	private Date writeDate;			//작성일
	private String plan_explain;	//일정에 대한 설명
	private String plan_name;		//작성자 명
	private String plan_place;		//여행 장소
	private String plan_season;		//여행 시즌
	private String plan_public;		//공개여부(Y/N)
	private String plan_start;		//여행 출발일
	private String plan_end;		//여행 종료일
	private int plan_readnum;		//조회수
	private String plan_file;		//이미지 파일 업로드
	
	public PlanDTO() {
		super();
	}

	public PlanDTO(int plan_idx, String plan_subject, String writer, Date writeDate, String plan_explain,
			String plan_name, String plan_place, String plan_season, String plan_public, String plan_start,
			String plan_end, int plan_readnum, String plan_file) {
		super();
		this.plan_idx = plan_idx;
		this.plan_subject = plan_subject;
		this.writer = writer;
		this.writeDate = writeDate;
		this.plan_explain = plan_explain;
		this.plan_name = plan_name;
		this.plan_place = plan_place;
		this.plan_season = plan_season;
		this.plan_public = plan_public;
		this.plan_start = plan_start;
		this.plan_end = plan_end;
		this.plan_readnum = plan_readnum;
		this.plan_file = plan_file;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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

}
