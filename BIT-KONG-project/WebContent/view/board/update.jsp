<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardlistVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/board_update.css">
	<jsp:include page="/view/template/header.jsp"></jsp:include>
	<%
		String[] coin_list = (String[])session.getAttribute("coin_list");
		BoardlistVO vo = (BoardlistVO)session.getAttribute("vo");
	%>
    <div class="con">
        <div class="box1">
            <div class="coin-board">
                <h3>게시판 글 수정</h3>
            </div>
        </div>
        <div class="box2">
        <form action="/board/update_rs" method="post" name="frm" onsubmit="return checks();">
                	<input type="hidden" name="b_id" value="<%= vo.getB_id()%>">
        	<div class="form-title">
        		<label>제목</label>
                <input type="text" class="b-title" placeholder="제목을 작성해주세요." name="b_title" maxlength="16" value="<%=vo.getB_title()%>">
        	</div>
        	<div class="form-title">
        		<label>작성자</label>
                <input type="text" class="b-name" placeholder="이름을 적어주세요." name="b_name" maxlength="10"  value="<%=vo.getB_name()%>">
        	</div>
        	<div class="form-title">
        		<label>코인리스트</label>
                <select name="c_tag" class="c-tag">
                	<%	for(int i = 0;i < coin_list.length; i++){%>
                	<option value=<%=vo.getC_tag() %>><%=coin_list[i] %>코인</option>
                		<%} %>
                	</select>
        	</div>
            <div class="form-write">
            	<label>내용</label>
            	<textarea class="b-write"name="b_context" maxlength="2048"><%=vo.getB_context() %></textarea>
            </div>
            <div class="form-submit">
                <input type="submit" class="btn-write" value="수정">
            </div>
        </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_board.js"></script>
    <script type="text/javascript">
		function checks() {
			if(!document.frm.b_title.value.trim()){
				alert("제목이 입력되지 않았습니다!");
				document.frm.b_title.focus();
				return false;
			}
			if(!document.frm.b_name.value.trim()){
				alert("이름이 입력되지 않았습니다!");
				document.frm.b_name.focus();
				return false;
			}
			if(!document.frm.b_pass.value.trim()){
				alert("비밀번호가 입력되지 않았습니다!");
				document.frm.b_pass.focus();
				return false;
			}
			if(!document.frm.b_context.value.trim()){
				alert("내용이 입력되지 않았습니다!");
				document.frm.b_context.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
