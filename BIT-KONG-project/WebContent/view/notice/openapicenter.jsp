<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/openapicenter.css">
<jsp:include page="/view/template/header.jsp"></jsp:include>
    <div class="con">
        <div class="box1">
            <div class="service-title">
                <h3>고객센터</h3>
            </div>
            <nav class="service-submenu">
                <ul>
                    <li><a href="/notice" >공지사항</a></li>
                    <li><a href="#">업비트소식</a></li>
                    <li><a href="#">프로젝트 공시</a></li>
                    <li><a href="#">거래 이용 안내</a></li>
                    <li><a href="#">입출금 이용 안내</a></li>
                    <li><a href="#">입출금 현황</a></li>
                    <li><a href="/openapi_guide" class="on">Open API 안내</a></li>
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
            	<h3>Open API 안내</h3>
            	<p>
            		비트콩식 API는 눈으로만 봐주세요.
            	</p>
            	<div class="img">
            		
            	</div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 400);
		</script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_noticce.js"></script>
</body>
</html>

