package ftt.unitforum_admin.types;

import java.util.Date;

public class UnitforumArticle {
	private int articleIdx;
	private String langCode;
	private int accountIdx;
	private String nickname;
	private String charGrade;
	private String content;
	private int likeCnt;
	private Date createDt;
	private int masterIdx;
	private int ssn;
	private String desc;
	private String class1Code;
	private String class1Name;
	private String class2Code;
	private String class2Name;
	private int worldIdx;
	private String worldName;

	public int getArticleIdx() {
		return articleIdx;
	}

	public void setArticleIdx(int articleIdx) {
		this.articleIdx = articleIdx;
	}
	
	public String getLangCode() {
		return langCode;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}

	public int getAccountIdx() {
		return accountIdx;
	}

	public void setAccountIdx(int accountIdx) {
		this.accountIdx = accountIdx;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCharGrade() {
		return charGrade;
	}

	public void setCharGrade(String charGrade) {
		this.charGrade = charGrade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public int getMasterIdx() {
		return masterIdx;
	}

	public void setMasterIdx(int masterIdx) {
		this.masterIdx = masterIdx;
	}

	public int getSsn() {
		return ssn;
	}

	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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
}
