package com.team3.model.bean;

public class Board {
	private int brdidx ; // 글번호
	private String memid ; // 작성자 아이디
	private String boardpwd ; // 비밀번호
	private String subtitle ; // 글제목
	private String contents ; // 글내용
	private String attach01 ; // 첨부파일
	private String attach02 ; // 첨부파일
	private String attach03 ; // 첨부파일
	private String attach04 ; // 첨부파일
	private int readcnt ; // 조회수
 	private String regdate ; // 등록일자
 	private String updated ; // 갱신일자
 	
 	// 차후 reply(답글)과 관련된 변수 	
 	private int groupnum ; 
 	private int ordernum ;
 	private int depthcnt ;
 	
 	// 차후 이모티콘과 관련된 변수
 	private int likes ; // 좋아요
 	private int hates ; // 싫어요
 	
 	public Board() {}

	public Board(int brdidx, String memid, String boardpwd, String subtitle, String contents, String attach01,
			String attach02, String attach03, String attach04, int readcnt, String regdate, String updated,
			int groupnum, int ordernum, int depthcnt, int likes, int hates) {
		super();
		this.brdidx = brdidx;
		this.memid = memid;
		this.boardpwd = boardpwd;
		this.subtitle = subtitle;
		this.contents = contents;
		this.attach01 = attach01;
		this.attach02 = attach02;
		this.attach03 = attach03;
		this.attach04 = attach04;
		this.readcnt = readcnt;
		this.regdate = regdate;
		this.updated = updated;
		this.groupnum = groupnum;
		this.ordernum = ordernum;
		this.depthcnt = depthcnt;
		this.likes = likes;
		this.hates = hates;
	}

	public int getBrdidx() {
		return brdidx;
	}

	public void setBrdidx(int brdidx) {
		this.brdidx = brdidx;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getBoardpwd() {
		return boardpwd;
	}

	public void setBoardpwd(String boardpwd) {
		this.boardpwd = boardpwd;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAttach01() {
		return attach01;
	}

	public void setAttach01(String attach01) {
		this.attach01 = attach01;
	}

	public String getAttach02() {
		return attach02;
	}

	public void setAttach02(String attach02) {
		this.attach02 = attach02;
	}

	public String getAttach03() {
		return attach03;
	}

	public void setAttach03(String attach03) {
		this.attach03 = attach03;
	}

	public String getAttach04() {
		return attach04;
	}

	public void setAttach04(String attach04) {
		this.attach04 = attach04;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public int getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public int getDepthcnt() {
		return depthcnt;
	}

	public void setDepthcnt(int depthcnt) {
		this.depthcnt = depthcnt;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getHates() {
		return hates;
	}

	public void setHates(int hates) {
		this.hates = hates;
	}

	@Override
	public String toString() {
		return "Board [brdidx=" + brdidx + ", memid=" + memid + ", boardpwd=" + boardpwd + ", subtitle=" + subtitle
				+ ", contents=" + contents + ", attach01=" + attach01 + ", attach02=" + attach02 + ", attach03="
				+ attach03 + ", attach04=" + attach04 + ", readcnt=" + readcnt + ", regdate=" + regdate + ", updated="
				+ updated + ", groupnum=" + groupnum + ", ordernum=" + ordernum + ", depthcnt=" + depthcnt + ", likes="
				+ likes + ", hates=" + hates + "]";
	}

 		
 	
}
