package ftt.unitforum_admin.types;

import java.util.Date;

public class UnitforumMainUnit {
	private int masterIdx;
	private String class1Code;
	private String class1Name;
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

	public String getClass1Name() {
		return class1Name;
	}

	public void setClass1Name(String class1Name) {
		this.class1Name = class1Name;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
}
