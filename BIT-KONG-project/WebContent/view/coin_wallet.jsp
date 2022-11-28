<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.RegisterVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO dao = new MemberDAO();
RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
%>
<jsp:include page="../view/template/header.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/coin_wallert.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script>
    let datas;
    $.ajax(
    		{
    			type:"GET",
    			url:"http://34.64.56.248:3000/coin-wallet/"+"<%= userVO.getM_id() %>",
    			dataType:"json",
    			success :  res => {
    				datas = res.data;
    				draw(datas)
    			},error: log =>{alert("DB 오류 발생")}
    		}
    	);
    	async function  draw(data) {
    		let d = {}
    		let total = 0
    		
    		for(let i = 0; i < data.length; i++){
    			d[data[i].coin_id] = {price:data[i].price,cnt:data[i].cnt}
    			total += data[i].price;
    		}
    		data = await change(data);
    		console.log(data);
    		total -= d["KRW"].price
    		let totalNow  = 0;
    		for(let i = 0; i < data.length; i++){
    			totalNow += data[i].now;
    		}
    		let pre_buy = total // 총매수
    		let cash = d["KRW"].price; // 현금
    		let totalM = totalNow; // 보유자금
    		let nowP = totalM - cash; // 총평가
    		let benefit = nowP - pre_buy; // 수익
            let percent = 0;//수익률
            if(benefit != 0){
                percent = Math.round((benefit / pre_buy)*10000)/100;//수익률
            }

    		let money = {
    				pre_buy,cash,totalM,nowP,benefit,percent
    		}
    		for(let i = 0; i < data.length; i++){
				data[i].percent = Math.round(data[i].now / totalM * 10000)/100
    		}
    		input(money);	
    		data.sort(function(a, b)  {
    			  return b.percent - a.percent;
    			});
    		charts(data)
    		lis(data)
    	}
    	function input(money) {
    		console.log(money)
    		document.querySelector("#pre_buy").innerText = money.pre_buy.toLocaleString();
    		document.querySelector("#cash").innerText = money.cash.toLocaleString();
    		document.querySelector("#totalM").innerText = money.totalM.toLocaleString();
    		document.querySelector("#nowP").innerText = money.nowP.toLocaleString();
    		document.querySelector("#benefit").innerText = money.benefit.toLocaleString();
    		document.querySelector("#percent").innerText = money.percent + "%";
            if(money.benefit >= 0){
                document.querySelector("#benefit").style.color = 'red';
                document.querySelector("#percent").style.color = 'red';
            }else {
                document.querySelector("#benefit").style.color = 'blue';
                document.querySelector("#percent").style.color = 'blue';
            }
    	}
    
    	async function change(data) {
    		let list = ["XRP","BTC","ETH","WEMIX","APM","MVC","XNO","JST","CON","SUN","SAND","SOL",
                "ANKR","ANV","TITAN","ETC","CTC","ADA","DOGE"]
			const options = {method: 'GET', headers: {accept: 'application/json'}};
    		let d;
    		await fetch('https://api.bithumb.com/public/ticker/ALL_KRW', options)
  			.then(response => response.json())
  			.then(response => {
			  	for(let i = 0; i< data.length;i++){
			  		if(data[i].coin_id != "KRW"){			  			
			  		data[i].now = response.data[data[i].coin_id].closing_price * data[i].cnt;

			  		data[i].upDown = Math.round(( (data[i].now - data[i].price) /data[i].price)*10000)/100
			  		}else {
				  		data[i].now = data[i].price;			  			
			  		}
			  	}
  				d = data
  				}
  			)
  			.catch(err => console.error(err));
			return d
    	}
    	function lis(value) {
    		document.querySelector(".tab").innerHTML = '<ul><li>코인명</li><li>보유수량</li><li>매수금액</li><li>평가금액</li><li>평가수익</li></ul>';
    		for(let i = 0; i< value.length;i++){
    			if(value[i].coin_id != "KRW"){
		  		let dom = document.createElement('ul');
		  		dom.classList.add('coin');
                
		  		dom.innerHTML = "<li>"+value[i].coin_id+"</li><li>"+value[i].cnt+" "+value[i].coin_id+"</li><li>"+value[i].price.toLocaleString() +"KRW</li>"+
		  		"<li>"+value[i].now.toLocaleString()+" KRW</li><li style='color:"+ ((value[i].now- value[i].price)>=0?'red':'blue') +"'>"+value[i].upDown+"%<br>"+(value[i].now- value[i].price).toLocaleString()+"KRW</li>";
		  		document.querySelector(".tab").append(dom);
    			}
		  	}
    	}
    	function charts(value) {
    		let list = new Array();
    		let col = new Array();
    		let pre = new Array();
    		let color = ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"];
			document.querySelector("#putCh").innerHTML = "";    		
    		for(let i = 0;i< value.length;i++){
    			list.push(value[i].coin_id);
    			col.push(color[i])
    			pre.push(value[i].percent)
    			let dom = document.createElement("li");
    			dom.innerHTML = `<div class="co" style="background-color: `+color[i]+`;"></div>`+value[i].coin_id+`<span>`+value[i].percent+`%</span>`;
    			document.querySelector("#putCh").append(dom);
    		}
    		console.log(pre)
            new Chart(document.getElementById("pie-chart"), {
                type: 'doughnut',
                data: {
                    labels: list,
                    datasets: [{
                        label: "",
                        backgroundColor: col,
                        data: pre
                    }]
                }, options: {
                    legend: {
                        display: false
                    }
                }
            });
    	}
	</script>
    <div class="con">
        <div class="assets">
            <h2>내 보유자산</h2>
            <div class="assets-list">
                <ul>
                    <li>
                        <h4>보유KRW</h4>
                        <span id="cash">${datas[0].price}</span> 
                    </li>
                    <li class="bar"></li>
                    <li>
                        <h4>총 보유자산</h4>
                        <span id="totalM">1,622,787,086</span>
                    </li>
                </ul>
            </div>
            <div class="info">
                <ul>
                    <li>
                        <p>총매수</p>
                    </li>
                    <li>
                        <p id="pre_buy">424,710,719</p>
                    </li>
                    <li>
                        <p>평가순익</p>
                    </li>
                    <li>
                        <p><span id="benefit">35,029,790</span></p>
                    </li>
                </ul>
                <ul>
                    <li>
                        <p>총평가</p>
                    </li>
                    <li>
                        <p id="nowP">459,740,508</p>
                    </li>
                    <li>
                        <p>수익률</p>
                    </li>
                    <li>
                        <p><span id="percent">8.25%</span></p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="coin-list">
            <div class="top">
                <input type="text" placeholder="코인명 검색">
                <div><input type="checkbox" id="checkbox"><span>보유코인만</span></div>
            </div>
            <div class="tab">
                <ul>
                    <li>코인명</li>
                    <li>보유수량</li>
                    <li>매수금액</li>
                    <li>평가금액</li>
                    <li>평가수익</li>
                </ul>
                <ul class="coin">
                    <li>BTE</li>
                    <li>1,890,030,344 KRW</li>
                    <li>1,890,030,344 KRW</li>
                    <li>1,890,030,344 KRW</li>
                    <li>97.31%<br>s2342342</li>
                </ul>
                <ul class="coin">
                    <li><input type="checkbox" id="a"><label for="a"><i class="bi bi-star-fill"></i></label></li>
                    <li>콩트코인</li>
                    <li>97.31%</li>
                    <li>1,890,030,344 KRW</li>
                    <li>1,890,030,344 KRW</li>
                </ul>
            </div>
        </div>
        <div class="graph">
            <h2>보유자산 포트폴리오</h2>
            <div style="position: relative; height:200px; width:320px;">
                <canvas id="pie-chart" width="400" height="400"></canvas>
            </div>
            <ul id='putCh'>
                <li><div class="co" style="background-color: #3e95cd;"></div>KRW<span>71.7%</span></li>
                <li><div class="co" style="background-color: #8e5ea2;"></div>DOGE <span>20.5%</span></li>
                <li><div class="co" style="background-color: #3cba9f;"></div>EMC2 <span>3.9%</span></li>
                <li><div class="co" style="background-color: #e8c3b9;"></div>BCH <span>2.0%</span></li>
                <li><div class="co" style="background-color: #c45850;"></div>IOST <span>1.9%</span></li>
            </ul>
 	<script type="text/javascript">
			setTimeout(() => {
			document.querySelector('.con').style.opacity = 1;
			document.querySelector('#pop').style.display = 'none';
			}, 700);
		</script>
        </div>
    </div>
</body>
</html>