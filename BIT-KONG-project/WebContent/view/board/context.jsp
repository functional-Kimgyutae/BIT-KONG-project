<%@page import="vo.RegisterVO"%>
<%@page import="vo.BoardlistVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/board_context.css">
<%
	BoardlistVO vo = (BoardlistVO)session.getAttribute("list_data");
	RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
%>
	<jsp:include page="/view/template/header.jsp"></jsp:include>
    <div class="con">
        <div class="box1">
            <div class="coin-board">
                <h3>코인별 게시판</h3>
            </div>
        </div>
        <div class="box2">
        	<div class="info">
        		<h3>자유 게시판</h3>
        		<div class="table-b">
        			<div class="view">
        				<strong class="tit"><%=vo.getB_title() %></strong>
        				<span>등록일 <%=vo.getB_date() %> | 조회수 <%=vo.getB_view() %> | 작성자 <%=vo.getB_name() %></span>
        			</div>
        		</div>
                <div class="txt">
	            	<p><%=vo.getB_context() %></p>
	            </div>
	            <div class="btn-right">
        	    	<a class="back" href="<%=request.getContextPath()%>/board">목록</a>
        	    <% if(userVO.getM_id().equals(vo.getM_id())) { %>
            		<a class="update" href="<%=request.getContextPath()%>/board/update?b_id=<%=vo.getB_id()%>">수정</a>
            		<a class="delete" href="<%=request.getContextPath()%>/board/delete?b_id=<%=vo.getB_id()%>">삭제</a>
            	<% } %>
    	        </div>
        	</div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_board.js"></script>
</body>
</html>
