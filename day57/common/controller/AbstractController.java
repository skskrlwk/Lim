package common.controller;

public abstract class AbstractController implements Command {

	
	private boolean isRedirect = false;
	/*
	  	view단 페이지(.jsp 페이지)로 이동시
	  	redirect 방법(데이터 전달은 못하고 단순히 페이지 이동만 하는것)으로
	  	이동시키고자 한다라면  isRedirect 변수의 값을 true 로 해주면 된다.
	  	
	  	view단 페이지(.jsp 페이지)로 이동시
	  	forward(dispatcher) 방법(데이터 전달을 하면서 페이지 이동을 하는것)으로
	  	이동시키고자 한다라면 isRedirect 변수의 값을 false로 해주면 된다.
	  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	 */
	
	private String viewPage;
	// view단 페이지(.jsp 페이지)의 경로명으로 사용되어지는 변수이다.

	public boolean isRedirect() {
		return isRedirect;
		// 리턴타입이 boolean 이라면 get이 아니라 is로 나타난다.
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	
	
}
