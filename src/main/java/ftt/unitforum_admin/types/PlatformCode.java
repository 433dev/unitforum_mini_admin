package ftt.unitforum_admin.types;

import com.fasterxml.jackson.annotation.JsonSetter;

public class PlatformCode {
	private int category;
	private int code;
	private String name;
	private int order;
	private boolean hide;
	private String shortName;

	public int getCategory() {
		return category;
	}

	@JsonSetter("Category")
	public void setCategory(int category) {
		this.category = category;
	}

	public int getCode() {
		return code;
	}

	@JsonSetter("Code")
	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	@JsonSetter("Name")
	public void setName(String name) {
		this.name = name;
	}

	public int getOrder() {
		return order;
	}

	@JsonSetter("Order")
	public void setOrder(int order) {
		this.order = order;
	}

	public boolean getHide() {
		return hide;
	}

	@JsonSetter("IsHide")
	public void setHide(boolean hide) {
		this.hide = hide;
	}

	public String getShort() {
		return shortName;
	}

	@JsonSetter("Short")
	public void setShort(String shortName) {
		this.shortName = shortName;
	}
}
