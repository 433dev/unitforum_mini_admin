package ftt.unitforum_admin.types;

import java.util.Date;

public class UnitforumLog {
	private int adminLogIdx;
	private int articleHistIdx;
	private int articleIdx;
	private String adminNo;
	private String adminID;
	private String logType;
	private String comment;
	private Date createDt;
	
	public int getAdminLogIdx() {
		return adminLogIdx;
	}
	public void setAdminLogIdx(int adminLogIdx) {
		this.adminLogIdx = adminLogIdx;
	}
	public int getArticleHistIdx() {
		return articleHistIdx;
	}
	public void setArticleHistIdx(int articleHistIdx) {
		this.articleHistIdx = articleHistIdx;
	}
	public int getArticleIdx() {
		return articleIdx;
	}
	public void setArticleIdx(int articleIdx) {
		this.articleIdx = articleIdx;
	}
	public String getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreateDt() {
		return createDt;
	}
	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

}
