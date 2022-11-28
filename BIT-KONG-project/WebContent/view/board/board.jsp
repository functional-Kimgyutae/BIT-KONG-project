<%@page import="vo.PaginationVO"%>
<%@page import="vo.BoardlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/coin_board.css">
    <%
    	int c_tag = (int)session.getAttribute("c_tag");
    	String[] coin_list = (String[])session.getAttribute("coin_list");
    	ArrayList<BoardlistVO> list = (ArrayList<BoardlistVO>)session.getAttribute("list");
    	PaginationVO pVO = (PaginationVO)session.getAttribute("pVO");
    %>
	<jsp:include page="/view/template/header.jsp"></jsp:include>
    <div class="con">
        <div class="box1">
            <div class="coin-board">
                <h3>코인별 게시판</h3>
            </div>
            <div class="coins">
                <ul class="bitcoin">
                	<%for(int i = 0; i < coin_list.length; i++){ %>
                    <li><a href="<%=request.getContextPath() %>/board?c_tag=<%=i %>" class="<%= c_tag == i ? "on" :"" %>"><%= coin_list[i] %>코인</a></li>
                    <%} %>
                </ul>
            </div>
        </div>
        <div class="box2">
            <div class="board-main">
            	<div class="board-write">
            		<a href="/board/write">글쓰기</a>
            	</div>
                <div class="board-title">
                    <h2><%= coin_list[c_tag] %>코인 게시판에 오신걸 환영합니다.</h2>
                    <span>코인 관련된 분석 및 정보글을 적는 게시판입니다.</span>
                </div>
            </div>
            <div class="table-div">
            <table>
                <tr>
                	<th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
                <%for(BoardlistVO vo : list ){%>
                <tr>
                	<td><%=vo.getB_id() %></td>
                    <td><p><a href="<%=request.getContextPath()%>/board/context?b_id=<%=vo.getB_id()%>"><%=vo.getB_title() %></p></a></td>
                    <td><%=vo.getB_name() %></td>
                    <td><%=vo.getB_date()%></td>
                    <td><%=vo.getB_view() %></td>
                </tr>
                <%} %>
            </table>
            </div>
            <div class="paglist">
                <ul class="pagination">
                <% if(pVO.isIsPrePage()) {%>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/board?c_tag=<%= c_tag %>&idx=<%= pVO.getStart()-1 %>">&lt;</a></li>
                <%} %>
                <% for(int i = pVO.getStart(); i<= pVO.getEnd();i++ ){ %>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/board?c_tag=<%= c_tag %>&idx=<%= i %>" class="num <%= i == pVO.getCurrentPage() ? "action" : "" %>"><%=i %></a></li>
                <%} %>
                <% if(pVO.isIsNextPage()) {%>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/board?c_tag=<%= c_tag %>&idx=<%= pVO.getEnd()+1 %>">&gt;</a></li>
                <%} %>
                </ul>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 500);
		</script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_board.js"></script>
</body>
</html>
