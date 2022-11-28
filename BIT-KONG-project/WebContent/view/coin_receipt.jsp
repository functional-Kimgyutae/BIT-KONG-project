<%@page import="vo.PaginationVO"%>
<%@page import="java.text.*"%>
<%@page import="vo.RegisterVO"%>
<%@page import="dao.ReceiptDAO"%>
<%@page import="vo.ReceiptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../view/template/header.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/coin_receipt.css">
    
    <%
    	ReceiptDAO dao = new ReceiptDAO();
    	PaginationVO pVO = (PaginationVO)session.getAttribute("pVO");
    	RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
    	ArrayList<ReceiptVO> list = dao.getReceiptlist(userVO.getM_id(),pVO.getStartBoard(),pVO.getEndBoard());
    	DecimalFormat df = new DecimalFormat("###,###");
    %>
    <div class="con">
        <div class="box1">
            <h2>거래내역</h2>
            <ul class="period-menu">
                <li><a href="#" class="on">전체</a></li>
                <li><a href="#">1주일</a></li>
                <li><a href="#">1개월</a></li>
                <li><a href="#">3개월</a></li>
                <li><a href="#">6개월</a></li>
            </ul>
        </div>
        <div class="box2">
            <table>
                <tr>
                    <th>No.</th>
                    <th>날짜</th>
                    <th>코인</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>매도/매수</th>
                    <th>체결/미체결</th>
                    <th>거래완료</th>
                </tr>    <!-- isbuy 0 매도 1 매수 isdone 0 체결 1 미체결 -->
        		<%for(ReceiptVO vo : list){
        			String Isbuy = "";
        			switch(vo.getIsbuy()){
        				case "0":
        					Isbuy = "매도";
        					break;
        				case "1":
        					Isbuy = "매수";
        			}
        			String Isdone = "";
        			switch(vo.getIsdone()){
        				case "0":
        					Isdone = "미체결";
        					break;
        				case "1":
        					Isdone = "체결";
        					break;
        				case "2":
        					Isdone = "거래취소";
        			}
        		%>
                <tr>
                    <th><%=vo.getIdx() %></th>
                    <th><%=vo.getDonetime() %></th>
                    <th><%=vo.getCoin_id() %></th>
                    <th><%=vo.getCnt()%></th>
                    <th><%=df.format(vo.getPrice())%></th>
                    <th><%=Isbuy %></th>
                    <th><%=Isdone %></th>
                    <th><%if(vo.getIsdone().equals("0")){%><a href="#" onclick="chekk(<%= vo.getIdx() %>);">취소</a><%}else{ %>완료<%} %></th>
                </tr>
                <%} %>
            </table>
            <div class="paglist">
                <ul class="pagination">
                <% if(pVO.isIsPrePage()) {%>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/coin/coin_receipt?idex=<%= pVO.getStart()-1 %>">&lt;</a></li>
                <%} %>
                <% for(int i = pVO.getStart(); i<= pVO.getEnd();i++ ){ %>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/coin/coin_receipt?idex=<%= i %>" class="num <%= i == pVO.getCurrentPage() ? "action" : "" %>"><%=i %></a></li>
                <%} %>
                <% if(pVO.isIsNextPage()) {%>
                    <li class="page-item"><a href="<%= request.getContextPath()%>/coin/coin_receipt?idex=<%= pVO.getEnd()+1 %>">&gt;</a></li>
                <%} %>
                </ul>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	function chekk(idx) {
    	$.ajax(
        {
            type:"PUT",
            url:"http://34.64.56.248:3000/execution-history/"+idx,
            dataType:"json",
            success :  res => {
				alert("취소되었습니다.");
				location.reload();
            },error: log =>{alert("DB 오류 발생")}
        }
    	);
    	}
    </script>
    <script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 500);
		</script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/coin_receipt.js"></script>
</body>
</html>
