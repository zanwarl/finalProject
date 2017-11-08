package korea.member.model;

import java.sql.*;

public class MemberDTO {

	private int member_idx;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_sex;
	private String member_birth;
	private String member_tel;
	private String member_email;
	private String member_addr;
	private String member_host_grade;	
	private Date member_joindate;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int member_idx, String member_id, String member_pwd, String member_name, String member_sex,
			String member_birth, String member_tel, String member_email, String member_addr, String member_host_grade,
			Date member_joindate) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_sex = member_sex;
		this.member_birth = member_birth;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_addr = member_addr;
		this.member_host_grade = member_host_grade;
		this.member_joindate = member_joindate;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_host_grade() {
		return member_host_grade;
	}
	public void setMember_host_grade(String member_host_grade) {
		this.member_host_grade = member_host_grade;
	}
	public Date getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	
}
