package vo;

public class PaginationVO {
	int totalWriting; //총 글수
	int totalPageCnt; // 총 페이지 갯수
	int PagePerChapter = 9; // 페이지당 글 수
	int PagingBar = 5;// 페이지네이션 바 수
	int CurrentPage; //현재 페이지 번호
	int start = 1; // 페이지네이션바의 첫번째 페이지
	int end = 5; // 페이지네이션바의 마지막 페이지
	boolean IsPrePage=true; // << 페이지 존재 유무
	boolean IsNextPage=true; // >> 페이지 존재 유무
	int startBoard;
	int endBoard;
	
	public PaginationVO(int CurrentPage,int totalWriting) {
		this.CurrentPage = CurrentPage;
		this.totalWriting = totalWriting;
		this.SetOrganize();
		this.SetStartEnd();
		this.SetBoardIdx();
	}
	public boolean IsExist() { //화면에 뿌릴 수 있는 페이진지 확인
		if(this.totalPageCnt < this.CurrentPage || this.CurrentPage < 1) return false;
		return true;
	}
	private void SetOrganize() {// 총 페이지 갯수 구하기
		this.totalPageCnt = (this.totalWriting / this.PagePerChapter) + 1; 
	}
	private void SetStartEnd() {
		this.end = (int)((Math.ceil((float)this.CurrentPage/this.PagingBar)) * this.PagingBar);
		this.start = this.end - this.PagingBar + 1;
		if(this.end > this.totalPageCnt) {
			this.end = this.totalPageCnt;
			this.IsNextPage = false;
		}
		if(this.start <= 1) {
			this.start = 1;
			this.IsPrePage = false;
		}
	}
	public void SetBoardIdx() { //가져와야하는 글 알려주는 함수
		this.startBoard = (this.CurrentPage -1)*9 + 1;
		this.endBoard = (this.CurrentPage )*9 -1;
		if(this.endBoard > this.totalWriting) {
			this.endBoard = this.totalWriting;
		}
	}
	
	
	public int getStart() {
		return start;
	}
	public int getEnd() {
		return end;
	}
	public boolean isIsPrePage() {
		return IsPrePage;
	}
	public boolean isIsNextPage() {
		return IsNextPage;
	}
	public int getStartBoard() {
		return startBoard;
	}
	public int getEndBoard() {
		return endBoard;
	}
	
	public int getCurrentPage() {
		return CurrentPage;
	}
	
}
