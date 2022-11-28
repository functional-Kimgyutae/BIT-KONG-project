<%@page import="vo.NoticeVO"%>
<%@page import="vo.RegisterVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/notice_context.css">
<%
	NoticeVO vo = (NoticeVO)session.getAttribute("list_data");
	RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
%>
	<jsp:include page="/view/template/header.jsp"></jsp:include>
    <div class="con">
        <div class="box1">
            <div class="service-title">
                <h3>고객센터</h3>
            </div>
            <nav class="service-submenu">
                <ul>
                    <li><a href="/notice" class="on">공지사항</a></li>
                    <li><a href="#">업비트소식</a></li>
                    <li><a href="#">프로젝트 공시</a></li>
                    <li><a href="#">거래 이용 안내</a></li>
                    <li><a href="#">입출금 이용 안내</a></li>
                    <li><a href="#">입출금 현황</a></li>
                    <li><a href="/openapi_guide">Open API 안내</a></li>
                    <li><a href="#">정책 및 거래지원 문의</a></li>
                    <li><a href="#">1:1 문의하기</a></li>
                    <li><a href="#">문의내역</a></li>
                    <li><a href="#">이용자 가이드</a></li>
                    <li><a href="#">카카오톡 문의(24시간)</a></li>
                </ul>
            </nav>
        </div>
        <div class="box2">
        	<div class="info">
        		<h3>공지사항</h3>
        		<div class="table-b">
        			<div class="view">
        				<strong class="tit"><%=vo.getN_title() %></strong>
        				<span>등록일 <%=vo.getN_date() %> | 조회수 <%=vo.getN_view() %></span>
        			</div>
		            <div class="txt">
		            	<p><%=vo.getN_context() %></p>
		            </div>
        		</div>
	            <div class="btn-right">
        	    	<a class="back" href="<%=request.getContextPath()%>/notice">목록</a>
    	        </div>
        	</div>
           <%--  <ul class="list">
            	<li><a class="back" href="<%=request.getContextPath()%>/notice">돌아가기</a></li>
            	
            <% if(userVO.getM_id().equals(vo.getM_id())) { %>
            	<li><a class="update" href="#">수정</a></li>
            	<li><a class="delete" href="#">삭제</a></li>
            <%} %>
            </ul> --%>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_board.js"></script>
</body>
</html>
