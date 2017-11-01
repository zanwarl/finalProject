package korea.tour.model;

import java.sql.Date;

public class tourCmtDTO {
	private String tour_cmt_idx;			//comment idx
	private String tour_cmt_pidx;			//parent idx
	private String tour_cmt_midx;			//member idx
	private String tour_cmt_writer;		//작성자
	private String tour_cmt_content;	//내용
	private Date tour_cmt_writeDate;	//작성일
	
	
	public tourCmtDTO() {
		super();
	}
	public tourCmtDTO(String tour_cmt_idx, String tour_cmt_pidx, String tour_cmt_midx, String tour_cmt_writer,
			String tour_cmt_content, Date tour_cmt_writeDate) {
		super();
		this.tour_cmt_idx = tour_cmt_idx;
		this.tour_cmt_pidx = tour_cmt_pidx;
		this.tour_cmt_midx = tour_cmt_midx;
		this.tour_cmt_writer = tour_cmt_writer;
		this.tour_cmt_content = tour_cmt_content;
		this.tour_cmt_writeDate = tour_cmt_writeDate;
	}
	public String getTour_cmt_idx() {
		return tour_cmt_idx;
	}
	public void setTour_cmt_idx(String tour_cmt_idx) {
		this.tour_cmt_idx = tour_cmt_idx;
	}
	public String getTour_cmt_pidx() {
		return tour_cmt_pidx;
	}
	public void setTour_cmt_pidx(String tour_cmt_pidx) {
		this.tour_cmt_pidx = tour_cmt_pidx;
	}
	public String getTour_cmt_midx() {
		return tour_cmt_midx;
	}
	public void setTour_cmt_midx(String tour_cmt_midx) {
		this.tour_cmt_midx = tour_cmt_midx;
	}
	public String getTour_cmt_writer() {
		return tour_cmt_writer;
	}
	public void setTour_cmt_writer(String tour_cmt_writer) {
		this.tour_cmt_writer = tour_cmt_writer;
	}
	public String getTour_cmt_content() {
		return tour_cmt_content;
	}
	public void setTour_cmt_content(String tour_cmt_content) {
		this.tour_cmt_content = tour_cmt_content;
	}
	public Date getTour_cmt_writeDate() {
		return tour_cmt_writeDate;
	}
	public void setTour_cmt_writeDate(Date tour_cmt_writeDate) {
		this.tour_cmt_writeDate = tour_cmt_writeDate;
	}
	
	
	
}
