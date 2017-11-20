package korea.plan.model;

import java.util.Date;

public class PlanJoinDTO {

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
	
	private String name;
	
	public PlanJoinDTO() {
		super();
	}

	public PlanJoinDTO(int plan_idx, String plan_subject, String plan_writer, Date plan_writeDate, String plan_explain,
			String plan_name, String plan_place, String plan_season, String plan_public, String plan_start,
			String plan_end, int plan_readnum, String plan_file, String name) {
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
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
