package ftt.unitforum_admin.types;

public class CodeObject {
	
	private int code;
	private String name;
	private String nameEn;
	private String shortName;
	private boolean hidden;
	
	public CodeObject(int code, String name, String nameEn, String shortName, boolean hidden) {
		this.code = code;
		this.name = name;
		this.nameEn = nameEn;
		this.shortName = shortName;
		this.hidden = hidden;
	}
	
	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNameEn() {
		return nameEn;
	}
	
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	
	public String getShortName() {
		return shortName;
	}
	
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	public boolean isHidden() {
		return hidden;
	}
	
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
}
