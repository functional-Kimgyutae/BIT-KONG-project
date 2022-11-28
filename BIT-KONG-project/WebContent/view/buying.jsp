<%@page import="vo.RegisterVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../view/template/header.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/buying.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-icons-1.8.3/fonts/bootstrap-icons.woff">
    <%
MemberDAO dao = new MemberDAO();
RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
%>
    <div class="con">
        <div class="box1">
        	<p><span id="now_coin">BTC</span> <span id="values">
        	</span>
        	<button class="coin_time" data-time="1m">1분</button><button class="coin_time basic btn_hov"data-time="30m">30분</button>
        	<button class="coin_time" data-time="1h">1시간</button><button class="coin_time"data-time="24h">1일</button></p>
            <div id="chart"></div>
        </div>
		
        <div class="box2">
        	<div class="search">
        		<input type="text" placeholder="코인명 검색">
        		<a href="#"><i class="bi bi-search"></i></a>
        	</div>
        	<table class="coinlist">
        		<tr>
        			<th>한글명</th>
        			<th>현재가</th>
        			<th>전일대비</th>
        			<th>거래대금</th>
        		</tr>
        	</table>
        	<div class="scrolld">
				<table>
					<tr>
						<td class="name">콩트코인</td>
						<td class="price">280000</td>
						<td class="cent">
						<p>%</p>
						<span>-0.10</span>
						</td>
						<td class="deal">141백만</td>
					</tr>
					<tr>
						<td class="name">콩트코인</td>
						<td class="price">280000</td>
						<td class="cent">
						
						<span>-0.10</span>
						</td>
						<td class="deal">141백만</td>
					</tr>
					<tr>
						<td class="name">콩트코인</td>
						<td class="price">280000</td>
						<td class="cent">
						<p>%</p>
						<span>-0.10</span>
						</td>
						<td class="deal">141백만</td>
					</tr>
					<tr>
						<td class="name">콩트코인</td>
						<td class="price">280000</td>
						<td class="cent">
						<p>%</p>
						<span>-0.10</span>
						</td>
						<td class="deal">141백만</td>
					</tr>															
				</table>
        	</div>
        </div>
        <div class="box3">
        	<div class="asking-price-main">
		        <h2>일반호가</h2>
		        <div class="asking-price-table">
		        <table>
		        	<tr class="down">
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>	
		        	</tr>
		        	<tr class="down">
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>	
		        	</tr>
		        	<tr class="down">
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>	
		        	</tr>
		        	<tr class="down">
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>	
		        	</tr>
		        	<tr class="up">
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        	</tr>		        			        			        	
		        	<tr class="up">
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        	</tr>
		        	<tr class="up">
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        	</tr>
		        	<tr class="up">
		        		<td class="downe">
		        		<a href="#">
		        		<div class="ty03">23,440,000</div>
		        		<div class="ty02">-0.43%</div>
		        		</a>
		        		</td>
		        		<td class="bar">
		        		<div class="ty01">0.000</div>
		        		</td>
		        	</tr>
		        </table>
		        </div>
        	</div>
        </div>
        <div class="box4">
        <div class="title"><h2 class="buy"><a href="#">매수</a></h2><h2 class="sell"><a href="#">매도</a></h2></div>
        <div class="order">
        	<div class="price"><p>주문 가능</p><strong>0</strong></div>
        	<div class="pricenum">
        	<strong>매수 / 매도 가격</strong>
        	<div class="inputd">
        		<input type="text" class="txr" value="0">
        		<a href="#" class="plus">+</a>
        		<a href="#" class="minus">-</a>
        	</div>
        	</div>
        	<div class="pricesize"><strong>주문 수량</strong><div class="inputd"><input type="text" value="0"></div></div>
        	<div class="Quantity">
        	<a href="#" class="qtbt">10%</a>
        	<a href="#" class="qtbt">25%</a>
        	<a href="#" class="qtbt">50%</a>
        	<a href="#" class="qtbt">100%</a>
        	<a href="#" class="qtbt">직접입력</a>
        	</div>
        	<div class="pricetotal"><strong>주문총액</strong><div class="inputd"><input type="text" value="0"></div></div>
        	<div class="buysell"><a href="#">매수 & 매도</a></div>
        </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="module" src="<%=request.getContextPath() %>/resoures/javascript/buy.js"></script>
	<script type="module">
		import call  from "<%=request.getContextPath() %>/resoures/javascript/coin_chart.js"
		import coin  from "<%=request.getContextPath() %>/resoures/javascript/coin_asking_price.js"
function but_C(div) {
  var lii = document.querySelectorAll(".coin_time")
  ;[].forEach.call(lii, function (col) {
    col.classList.remove("btn_hov")
  })
  div.className += " btn_hov"
}
let bigData = []
let chartData
window.closeData = 0;
let nowCoin = "BTC";
list_set()
call("30m", nowCoin)
setTimeout(() => {
	coin(nowCoin,closeData)
}, 500);
let isC = ''
document.querySelector(".scrolld>table").addEventListener("click", (e) => {
    nowCoin = e.target.parentNode.dataset.coin
	setTimeout(() => {
		coin(nowCoin,closeData)
	}, 500);
  call("30m", nowCoin)
  but_C(document.querySelector(".basic"))
})

var cols = document.querySelectorAll(".coin_time")
;[].forEach.call(cols, function (col) {
  col.addEventListener("click", (e) => {
    call(e.target.dataset.time, document.querySelector("#now_coin").innerHTML)
    but_C(e.target)
  })
})

function list_set() {
  const options = { method: "GET", headers: { accept: "application/json" } }
  setInterval(() => {
    fetch("https://api.bithumb.com/public/ticker/ALL_KRW", options)
      .then((response) => response.json())
      .then((response) => draw(response.data))
      .catch((err) => console.error(err))
  }, 1000)
}
function draw(data) {
    let list = ["XRP","BTC","ETH","WEMIX","APM","MVC","XNO","JST","CON","SUN","SAND","SOL","ANKR","ANV","TITAN","ETC","CTC","ADA","DOGE"]
    let table = document.querySelector(".scrolld>table");
    table.innerHTML = "";
        let i = 0
    for (let key in list) {
        key = list[key]	
        if( i > 20) break;
        i++;
        let tr = document.createElement("tr");
        tr.dataset.coin=key;
        let cl = "up"
        let changeM = Math.round((data[key].closing_price - data[key].prev_closing_price)*100)/100        
        
        if(changeM < 0) {
            cl = "down"
        }else if(changeM == 0){
            cl = ""
        }
        tr.innerHTML = '<td class="name">'+key+'</td><td class="price">'+(data[key].closing_price*1).toLocaleString()+'</td><td class="cent price-'+cl+'">'+
        Math.floor(changeM / data[key].closing_price * 100*100)/100+'%<br>'+changeM.toLocaleString()+'</td><td class="deal">'+Math.floor(data[key].acc_trade_value_24H/1000000).toLocaleString()+'백만</td>';
            table.appendChild(tr)
            if(key == nowCoin){
            	document.querySelector("#now_coin").innerHTML = nowCoin      
				closeData = data[key].closing_price;
				if(changeM >= 0){
					document.querySelector('#values').innerHTML = '<span class="plus">'+data[key].closing_price+' </span> '+'<strong class="plus2">'+Math.floor(changeM / data[key].closing_price * 100*100) / 100+'% '+changeM+'</strong>';
				}else {
					document.querySelector('#values').innerHTML = '<span class="minus">'+data[key].closing_price+' </span> '+'<strong class="minus2">'+Math.floor(changeM / data[key].closing_price * 100*100) / 100+'% '+changeM+'</strong>';
				}
                if(isC != nowCoin) {
                    isC = nowCoin;
                    document.querySelector(".txr").value = data[key].closing_price;
					window.closeData = data[key].prev_closing_price;
					cler()
					if(nowBuy) {
						chbuy()
					}else{
						chsell()
					}
                }
            }
    }
}   
let d = {}
getMon();
console.log(d)

//내돈 가져오기 
function getMon() {
    
    $.ajax(
        {
            type:"GET",
            url:"http://34.64.56.248:3000/coin-wallet/<%= userVO.getM_id() %>",
            dataType:"json",
            success :  res => {
                let datas = res.data;
    		for(let i = 0; i < datas.length; i++){
    			d[datas[i].coin_id] = {price:datas[i].price,cnt:datas[i].cnt}
    		}
			document.querySelector('.price strong').innerHTML = (d["KRW"].price*1).toLocaleString()+'KRW';
            },error: log =>{alert("DB 오류 발생")}
        }
    );
}
document.querySelector('.pricesize .inputd input').addEventListener('change',e => {
	let va = e.target.value
	let ins = document.querySelector('.pricenum .inputd input').value;
	document.querySelector('.pricetotal .inputd input').value = ins *va;  
})
document.querySelector('.pricenum .inputd input').addEventListener('change',e => {
	let ins = document.querySelector('.pricesize .inputd input').value;
	document.querySelector('.pricetotal .inputd input').value = ins *e.target.value;  
})

function cler() {
	document.querySelector('.pricetotal .inputd input').value = 0
	document.querySelector('.pricesize .inputd input').value = 0
}
let nowBuy = true;
document.querySelector(".title .buy").addEventListener("click",()=> {
	chbuy()
});
document.querySelector(".title .sell").addEventListener("click",()=> {
	chsell()
});
document.querySelector('.buysell').addEventListener('click',()=> {
	checkBuySell();
})

function chbuy() {
	nowBuy = true;
	document.querySelector('.price strong').innerHTML = (d["KRW"].price*1).toLocaleString()+'KRW';
	document.querySelector('.pricenum strong').innerHTML = '매수 가격 (KRW)'
	document.querySelector('.buysell a').innerHTML = '매수'
}

function chsell(){
	nowBuy = false;
	if(nowCoin in d){
		document.querySelector('.price strong').innerHTML = d[nowCoin].cnt+" "+nowCoin;
	}else {
		document.querySelector('.price strong').innerHTML = '0 '+nowCoin;
	}
	document.querySelector('.pricenum strong').innerHTML = '매도 가격 (KRW)'
	document.querySelector('.buysell a').innerHTML = '매도'
}

function checkBuySell() {
	let ehs = document.querySelector('.pricetotal .inputd input').value; //돈
	let tnfid = document.querySelector('.pricesize .inputd input').value; //수량
	let rkrur = document.querySelector('.pricenum .inputd input').value // 개당 가격
	console.log("결제창")
	if(nowBuy){
		if(d["KRW"].price < ehs){
			alert("돈 부족");
			return 0;
		}
		$.ajax(
        {
            type:"POST",
            url:"http://34.64.56.248:3000/execution-history/<%= userVO.getM_id() %>",
            dataType:"json",
			data : {'coin_id':nowCoin,'price': ehs,'cnt':tnfid,'isbuy':1},
            success :  res => {
				alert("거래 등록");
				$.ajax(
        {
            type:"PUT",
            url:"http://34.64.56.248:3000/coin-wallet/<%= userVO.getM_id() %>",
            dataType:"json",
			data : {'coin_id':"KRW",'price': ehs,'cnt':0},
            success :  res => {
				location.reload();
            },error: log =>{alert("DB 오류 발생")}
        }
    	);
            },error: log =>{alert("DB 오류 발생")}
        }
    	);

	}else {
		if(!nowCoin in d ||d[nowCoin].cnt < tnfid){
			alert("수량 부족");
			return 0;
		}
		$.ajax(
        {
            type:"POST",
            url:"http://34.64.56.248:3000/execution-history/<%= userVO.getM_id() %>",
            dataType:"json",
			data : {'coin_id':nowCoin,'price': ehs,'cnt':tnfid,'isbuy':0},
            success :  res => {
				alert("거래 등록");
				$.ajax(
        {
            type:"PUT",
            url:"http://34.64.56.248:3000/coin-wallet/<%= userVO.getM_id() %>",
            dataType:"json",
			data : {'coin_id':nowCoin,'price': ehs,'cnt':tnfid},
            success :  res => {
				location.reload();
            },error: log =>{alert("DB 오류 발생")}
        }
    	);
            },error: log =>{console.log(log)}
        }
    	);
		
	}
}

// $.ajax(
//         {
//             type:"POST",
//             url:"http://34.64.56.248:3000/coin-wallet/<%= userVO.getM_id() %>",
//             dataType:"json",
// 			data : {'coin_id':nowCoin,'price': ehs,'cnt':tnfid},
//             success :  res => {
// 				alert("거래 등록");
// 				location.reload();
//             },error: log =>{alert("DB 오류 발생")}
//         }
//     	);
	</script> 
	<script type="text/javascript">
		setTimeout(() => {
		document.querySelector('.con').style.opacity = 1;
		document.querySelector('#pop').style.display = 'none';
		}, 1700);
	</script>
</body>
</html>