package ftt.unitforum_admin.types;

public class UnitforumGame {
	private int ssn;
	private String name;

	public UnitforumGame(int ssn, String name) {
		this.ssn = ssn;
		this.name = name;
	}
	
	public int getSsn() {
		return ssn;
	}

	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
