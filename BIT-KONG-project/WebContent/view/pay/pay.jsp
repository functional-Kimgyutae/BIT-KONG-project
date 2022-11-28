<%@page import="vo.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/coin_pay.css">
<%
	RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
%>
<jsp:include page="/view/template/header.jsp"></jsp:include>
        <div class="con">
        <div class="box1">
        	<div class="service">
        		<div class="money">
	        		<h2 class="title">가상화폐 충전하기</h2>
	        		<img src="<%=request.getContextPath() %>/resoures/image/충전2.png">
        		</div>
        		<ul>
        			<li class="emails">
        			<span>결제 하는 메일</span>
        			<div>
        				<span class="email"><%=userVO.getM_id() %></span>
        			</div>
        			</li>
        			<li class="pays">
        			<span>충전 예정	</span>
        			<div>
        				<span class="moneys"></span><span class="name"></span>
        			</div>
        			</li>
        		</ul>
        	</div>
        </div>
        <div class="box2">
        	<div class="pay-header">
        		<a href="#"><span class="header">비트콩식 가상화폐 구매 창입니다.</span></a>
        	</div>
        	<div class="price-list">
        		<dl>
        			<dt>
        				<span>결제 금액</span>
        			</dt>
        		</dl>
        		<dd>
        			<ul>

        			</ul>
        		</dd>
        	</div>
	        <div class="payment">
               	원하시는 금액을 클릭해주세요.
        	</div>
        	<div class="donge">
        		<dl class="dls">
        			<dt>
        				<span>가상 돈 정책 동의 및 결제 전 주의 사항</span>
        			</dt>
        		</dl>
        		<dd class="dds">
        			<div class="payok">
        				<span>결제 시 환불 불가능 하며 문의사항은 홈페이지 또는 고객센터를 확인 해주세요.</span>
        				<div class="dongehae">
        					<span>상품 가격 및 충전 금액을 확인하고, 개인 관련 고지 사항 과 비트콩식 정책 및 결제 진행에 동의 합니다.</span>
        					<button class="dongeham">동의</button>
        				</div>
        			</div>	
        		</dd>
        	</div>
        	<div class="pay-progress">
        	<button class="paying">결제하기</button>
        	</div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    	let price_list = [
    	    {
    	        price:5000,
    	        unit:"만",
    	        pay:500,
    	    },
    	    {
    	        price:1,
    	        unit:"억",
    	        pay:1000,
    	    },
    	    {
    	        price:2,
    	        unit:"억",
    	        pay:2000,
    	    },
    	    {
    	        price:5,
    	        unit:"억",
    	        pay:5000,
    	    },
    	    {
    	        price:10,
    	        unit:"억",
    	        pay:10000,
    	    },
    	    {
    	        price:15,
    	        unit:"억",
    	        pay:15000,
    	    },
    	    {
    	        price:20,
    	        unit:"억",
    	        pay:20000,
    	    },
    	]

    	let isChoose = false
    	let isAgree = false;
    	let ob = []

    	function drawPrice() {
    	    let dom = document.querySelector(".price-list > dd > ul")
    	    for (let i = 0; i < price_list.length; i++) {
    	        let div = document.createElement("li");
    	        div.innerHTML = 
    	        '<div class="price-point"><div class="pay-money"><span class="moneys">'+price_list[i].price+'</span><span class="name">'+price_list[i].unit+'</span>'+
							'</div><div class="price"> <span>'+price_list[i].pay+'원</span></div></div>';
    	        div.addEventListener("click",()=> change(price_list[i]));
    	        dom.appendChild(div);
    	    }

    	}

    	function change(item) {
    	    isChoose = true
    	    ob = item
    	    document.querySelector(".pays .moneys").innerHTML = item.price;
    	    document.querySelector(".pays .name").innerHTML = item.unit;
    	    let today = new Date();   

    	    let year = today.getFullYear(); // 년도
    	    let month = today.getMonth() + 1;  // 월
    	    let date = today.getDate();  // 날짜
    	    document.querySelector(".payment").innerHTML = '<span>결제 금액 : '+item.pay+'원</span>'+
    	    '<span>충전 금액 : '+item.price+''+item.unit+'</span>'+
    	    '<span>결제일 : '+year+'-'+month+'-'+date+'</span>'+
    	    '<span>고맙습니다 사랑합니다.</span>';
    	}
    	document.querySelector(".dongeham").addEventListener("click",(e)=> {
    	    {
    	        isAgree = !isAgree;
    	        console.log(e);
    	        if(isAgree){
    	            e.target.classList.add("dongehamnida");
    	            e.target.innerHTML = "동의"
    	        }else {
    	        	e.target.classList.remove("dongehamnida");
    	            e.target.innerHTML = "동의"
    	        }
    	    }
    	})

    	drawPrice();

    	document.querySelector(".paying").addEventListener("click",()=> {
    	    if(!isAgree || !isChoose){
    	        alert("상품 선택 또는 동의하세요");
    	        return;
    	    }
    	    pay();
    	})

    	function pay() {
    	    var IMP = window.IMP; // 생략가능
    	    IMP.init('imp02599474');
    	      IMP.request_pay({
    	        pg: "inicis",
    	        pay_method: "card",
    	        merchant_uid : 'merchant_'+new Date().getTime(),
    	        name :`비트콩식 결제요청 ${ob.pay}원`,
    	        amount : ob.pay,
    	        buyer_email : 'iamport@siot.do',
    	        buyer_name : '김규태',
    	        buyer_tel : '010-1234-5678',
    	        buyer_addr : '서울특별시 강남구 삼성동',
    	        buyer_postcode : '123-456'
    	      }, function (rsp) {
    	            if (rsp.success) {
    	                callAPI();
    	                console.log(rsp);
    	            } else {
    	              var msg = '결제에 실패하였습니다.';
    	              msg += '에러내용 : ' + rsp.error_msg;
    	              alert(msg);
    	            }
    	        });
    	}

    	function callAPI() {
			$.ajax(
        {
            type:"POST",
            url:"http://34.64.56.248:3000/coin-wallet/<%= userVO.getM_id() %>",
            dataType:"json",
			data : {'coin_id':'KRW','price': ob.pay*100000,'cnt':0},
            success :  res => {
				alert("충전완료");
				location.href='/index'
            },error: log =>{console.log(log)}
        }
    	);
    	}
    	$(".price-point").click(function(){
    	$(".price-point").click(function(){
        	$(".price-point").removeClass("action");
        	$(this).addClass("action");
        	$(".payment").addClass("action");
        	});
		});
    </script>
    <script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 400);
		</script>
</body>
</html>
