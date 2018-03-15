package ftt.unitforum_admin.types;

import java.util.Date;

public class UnitforumWorld {
	private int masterIdx;
	private int worldIdx;
	private String worldName;
	private Date createDt;

	public int getMasterIdx() {
		return masterIdx;
	}

	public void setMasterIdx(int masterIdx) {
		this.masterIdx = masterIdx;
	}

	public int getWorldIdx() {
		return worldIdx;
	}

	public void setWorldIdx(int worldIdx) {
		this.worldIdx = worldIdx;
	}

	public String getWorldName() {
		return worldName;
	}

	public void setWorldName(String worldName) {
		this.worldName = worldName;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
}
