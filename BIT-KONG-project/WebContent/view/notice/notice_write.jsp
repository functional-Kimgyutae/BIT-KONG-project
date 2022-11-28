<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/notice_write.css">
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
                <form class="table-b" action="/notice/write_rs" method="post" name="frm" onsubmit="return checks();">
                    <table>
            			<tbody>
                		<tr>
                			<td><input type="text" class="n-title" placeholder="제목을 입력해주세요." name="n_title" maxlength="16"></td>
                		</tr>
                		<tr>
                   			<td class="td2"><textarea class="n-write" placeholder="내용을 입력해주세요." name="n_context" maxlength="2048"></textarea></td>
                		</tr>
                		</tbody>
            		</table>
       			<div class="input-div">
	                <input type="submit" class="btn-write" value="글쓰기">
       			</div>
        	    </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
	function checks() {
		if(!document.frm.n_title.value.trim()){
			alert("제목이 입력되지 않았습니다!");
			document.frm.n_title.focus();
			return false;
		}
		if(!document.frm.n_context.value.trim()){
			alert("내용이 입력되지 않았습니다!");
			document.frm.n_context.focus();
			return false;
		}
		return true;
		}	
    </script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_noticce.js"></script>
</body>
</html>

