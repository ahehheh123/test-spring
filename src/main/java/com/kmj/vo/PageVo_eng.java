package com.kmj.vo;

//현재 화면에 출력하고자 하는 page를 기준으로 아래 변수를 셋팅.. 
//현재 화면에 출력하고자 하는 page가 15 페이지 이다..
//prev true, next true
public class PageVo_eng {
	private int startNo; // 페이지 내에서 게시물 시작 번호
	private int endNo ;   // 페이지 내에서 게시물 끝 번호
	private int perPageNum ; // 페이지 당 게시물 수, 페이지 그룹의 페이지 수
	private Integer page; //  페이지 번호 . jsp단에서 null로 값이 올때 에러가 발생하지 않도록 Integer사용
	private int totalCount ;  // 총 게시물
	private int endPage;      //현재 page 가 속해 있는 페이지 그룹의 끝번호
	private int startPage;   //  현재 page 가 속해 있는 페이지 그룹의 시작번호
	private boolean prev;   //
	private boolean next;   //
	// 검색용 변수 2개 추가
	private String searchType;       //  검색타입 : 제목, 글작성자, 
	private String searchKeyword;    //  검색어

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	private void calcPage() {
		// 이 메소드가 모든 변수 값을 계산합니다. 이때 이메서드가 시작될때, page=2, totalCount=96, perpageNum=10은 이미 결정이 된 상태입니다.
		// DB쿼리에서 사용... 시작데이터번호 = (jsp클릭한 페이지번호-1)*페이지당 보여지는 개수
		startNo = (this.page - 1) * perPageNum+1;   // 2페이지 

		// page변수는 현재 jsp에서 클릭한 페이지번호
		int tempEnd = (int) (Math.ceil(page / (double) this.perPageNum) * this.perPageNum);
		System.out.println(tempEnd);
		// ceil함수는 천장 함수로 1.1 = 2, 2.1 = 3 으로 출력된다.
		// 반대되는 바닥함수로 floor(), 반올림 함수로 round()가 있다.
		// jsp에서 클릭한 페이지번호를 기준으로 끝 페이지를 계산한다.
		this.startPage = (tempEnd - this.perPageNum) + 1;
		// 시작 페이지 계산 클릭한page번호 10일때 까지 시작페이지는 1
		if (tempEnd * this.perPageNum > this.totalCount) {
			// 클릭한 page번호로 계산된 게시물수가 실제게시물개수 totalCount 클때
			this.endPage = (int) Math.ceil(this.totalCount / (double) this.perPageNum);
			//                                   145/10 : 14.XX > 15
		} else {
			// 클릭한 page번호로 계산된 게시물수가 실제게시물개수 totalCount 작을때
			this.endPage = tempEnd;
		}
		if(page == totalCount/perPageNum+1) {
			this.endNo = (startNo + this.totalCount % 10)-1;
		}else {
			this.endNo = (startNo + this.perPageNum)-1;
		}
		this.prev = this.startPage != 1;// 시작페이지 1보다 크면 무조건 이전 페이지가 있음. true
		this.next = this.endPage * this.perPageNum < this.totalCount;
		// 클릭한 page번호로 계산된 게시물수가 실제 게시물 개수보다 작다면 다음페이지가 있음. true
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();// totalCount 전제게시물개수가 있어야지 페이지계산을 할 수 있기 때문에
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getStartNo() {

		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}
