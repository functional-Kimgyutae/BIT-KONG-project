<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/coin_notice.css">
<jsp:include page="/view/template/header.jsp"></jsp:include>
<%
	RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
	int n_tag = (int)session.getAttribute("n_tag");
	ArrayList<NoticeVO> list = (ArrayList<NoticeVO>)session.getAttribute("list");
	
%>
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
                <%if(userVO.getM_id().equals("admin")){ %>
                <div class="notice-write">
            		<a href="/notice/write">글쓰기</a>
            	</div>
            	<%} %>
                <div class="notice-serch">
                    <div class="input">
                        <input type="text" placeholder="검색어를 입력해주세요.">
                    </div>
                    <a class="serch-b" href="#">검색</a>
                </div>
                <div class="table-b">
                    <table>
                        <tr>
                        	<th>번호</th>
                            <th>제목</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                        <%for(NoticeVO vo : list){ %>
                        <tr>
                        	<td><%=vo.getN_id() %></td>
                            <td><a href="<%=request.getContextPath() %>/notice/context?n_id=<%=vo.getN_id()%>"><%=vo.getN_title() %></a></td>
                            <td><%=vo.getN_date() %></td>
                            <td><%=vo.getN_view() %></td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
            <!-- <div class="paglist">
                <ul class="pagination">
                    <li class="page-item"><a href="#">&lt;</a></li>
                    <li class="page-item"><a href="#" class="num action">1</a></li>
                    <li class="page-item"><a href="#" class="num">2</a></li>
                    <li class="page-item"><a href="#" class="num">3</a></li>
                    <li class="page-item"><a href="#" class="num">4</a></li>
                    <li class="page-item"><a href="#">&gt;</a></li>
                </ul>
            </div> -->
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 500);
		</script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_noticce.js"></script>
</body>
</html>

