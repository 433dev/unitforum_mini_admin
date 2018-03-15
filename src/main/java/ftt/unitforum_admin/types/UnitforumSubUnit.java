package ftt.unitforum_admin.types;

import java.util.Date;

public class UnitforumSubUnit {
	private int masterIdx;
	private String class1Code;
	private String class2Code;
	private String class2Name;
	private Date createDt;

	public int getMasterIdx() {
		return masterIdx;
	}

	public void setMasterIdx(int masterIdx) {
		this.masterIdx = masterIdx;
	}

	public String getClass1Code() {
		return class1Code;
	}

	public void setClass1Code(String class1Code) {
		this.class1Code = class1Code;
	}

	public String getClass2Code() {
		return class2Code;
	}

	public void setClass2Code(String class2Code) {
		this.class2Code = class2Code;
	}

	public String getClass2Name() {
		return class2Name;
	}

	public void setClass2Name(String class2Name) {
		this.class2Name = class2Name;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
}
