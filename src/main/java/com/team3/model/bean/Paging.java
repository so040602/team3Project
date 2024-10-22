package com.team3.model.bean;

public class Paging {
	//페이징 관련 변수
    private int totalCount = 0 ; //총 레코드 건수
    private int totalPage = 0 ; //전체 페이지 수

    private int pageNumber = 0 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
    private int pageSize = 0 ; //한 페이지에 보여줄 건수
    private int beginRow = 0 ; //현재 페이지의 시작 행
    private int endRow = 0 ; //현재 페이지의 끝 행

    private int pageCount = 10 ; //보여줄 페이지 링크 수
    private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
    private int endPage = 0 ; //페이징 처리 끝 페이지 번호

    private String url = "" ; //예시 ==>  http://localhost:8989/MyServlet/list.do
    private String pagingHtml = "";//하단의 숫자 페이지 링크
    private String pagingStatus = ""; //상단 우측의 현재 페이지 위치 표시

    //검색을 위한 변수 추가
    private String mode = "" ; //검색 모드(작성자, 글제목, 전체 검색은 all) 등등
    private String keyword = "" ; //검색할 단어

    //pagination Size 변수
    private String paginationSize = " pagination-sm" ; //  pagination-lg   pagination-sm    pagination-xs

    public Paging(String _pageNumber, String _pageSize,int totalCount, String url, String mode, String keyword) {
        // 여기 코딩해 오세요.
        if(_pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")){
            _pageNumber = "1";
        }
        this.totalCount = totalCount;
        this.totalPage = (totalCount % Integer.parseInt(_pageSize) == 0) ? totalCount / Integer.parseInt(_pageSize) : totalCount / Integer.parseInt(_pageSize) + 1;
        this.pageNumber = Integer.parseInt(_pageNumber);
        this.pageSize = Integer.parseInt(_pageSize);
        this.beginRow = this.pageSize * (this.pageNumber - 1) + 1;
        this.endRow = this.pageSize * this.pageNumber;
        if(this.totalCount < this.endRow) {
            this.endRow = this.totalCount;
        }
        this.beginPage = beginRow/pageSize - (((beginRow/pageSize)%pageCount) - 1);
        this.endPage = beginPage + (pageCount - 1);
        if(this.totalPage < this.endPage) { this.endPage = this.totalPage;}
        this.url = url;
        this.pagingStatus ="총 " + totalCount + "건[" + (beginRow/pageSize + 1) + "/" + totalPage + "]";
        this.mode = mode == null ? "" : mode;
        this.keyword = keyword == null ? "" : keyword;
//        int su = Integer.parseInt("150") ;
//        System.out.println("숫자 : " + su);
}
    public String getPagingHtml() {	return pagingHtml;}
    public int getPageNumber() {	return pageNumber;}
    public int getPageSize() {	return pageSize;}
    public String getPagingStatus() {	return pagingStatus;}
    public int getBeginRow() {	return beginRow;}
    public int getEndRow() {	return endRow;}

    public int getTotalPage() {
        return totalPage;
    }

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

    //상세 검색을 위하여 검색 모드와 검색 키워드 항목이 추가됨
    public String getMode() {return mode;}
    public String getKeyword() { return keyword; 	}

}
