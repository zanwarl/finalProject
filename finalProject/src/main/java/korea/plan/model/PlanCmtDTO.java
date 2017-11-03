package korea.plan.model;

import java.sql.Date;

public class PlanCmtDTO {

	private int planc_idx;			//인덱스
	private int planc_pidx;			//부모 테이블 idx
	private String planc_writer;	//작성자
	private String planc_content;	//내용
	private String planc_id;		//아이디
	private Date planc_writeDate;	//작성일
	
	
	public PlanCmtDTO() {
		super();
	}

	public PlanCmtDTO(int planc_idx, int planc_pidx, String planc_writer, String planc_content, String planc_id,
			Date planc_writeDate) {
		super();
		this.planc_idx = planc_idx;
		this.planc_pidx = planc_pidx;
		this.planc_writer = planc_writer;
		this.planc_content = planc_content;
		this.planc_id = planc_id;
		this.planc_writeDate = planc_writeDate;
	}

	public int getPlanc_idx() {
		return planc_idx;
	}

	public void setPlanc_idx(int planc_idx) {
		this.planc_idx = planc_idx;
	}

	public int getPlanc_pidx() {
		return planc_pidx;
	}

	public void setPlanc_pidx(int planc_pidx) {
		this.planc_pidx = planc_pidx;
	}

	public String getPlanc_writer() {
		return planc_writer;
	}

	public void setPlanc_writer(String planc_writer) {
		this.planc_writer = planc_writer;
	}

	public String getPlanc_content() {
		return planc_content;
	}

	public void setPlanc_content(String planc_content) {
		this.planc_content = planc_content;
	}

	public String getPlanc_id() {
		return planc_id;
	}

	public void setPlanc_id(String planc_id) {
		this.planc_id = planc_id;
	}

	public Date getPlanc_writeDate() {
		return planc_writeDate;
	}

	public void setPlanc_writeDate(Date planc_writeDate) {
		this.planc_writeDate = planc_writeDate;
	}
	
}
