const options = {
    method: 'GET',
    headers: {accept: 'application/json', 'content-type': 'application/json'},
    
  };  
let se;
  function coin(co,nowData) {
	  if(se != null) {clearInterval(se)}
	  fetch(`https://api.bithumb.com/public/orderbook/${co}_KRW`, options)
      .then(response => response.json())
      .then(response => {draw(response.data,nowData)})
      .catch(err => console.error(err));
	   se = setInterval(() => {
		   fetch(`https://api.bithumb.com/public/orderbook/${co}_KRW`, options)
	         .then(response => response.json())
	         .then(response => {draw(response.data,nowData)})
	         .catch(err => console.error(err));     
	   }, 1000);
  }
  function draw(data,nowData) {
    let div = document.querySelector(".asking-price-table > table > tbody");
    div.innerHTML = ""
    for (let i = 29; i >= 0; i--) {
      let changeM = Math.round((data.asks[i].price - window.closeData)*100)/100
      let dat = Math.floor(changeM / data.asks[i].price * 1000000)/10000
      let dom = document.createElement("tr");
      dom.className = "down"
    	  dom.innerHTML= `<td class="bar re">
      		<div class="ty01">${Math.round(data.asks[i].quantity*10000)/10000}</div>
      		</td>
      		<td class="downe re">
      		<a href="#">
      		<div class="ty03 re" >${(data.asks[i].price*1).toLocaleString()}</div>
      		<div class="ty02 re">${dat}%</div>
      		</a>
      		</td>`;
   
      div.append(dom);
    }
    for (let i = 0; i < 30; i++) {
      let dom = document.createElement("tr");
      let changeM = Math.round((data.bids[i].price - window.closeData)*100)/100
      let dat = Math.floor(changeM / data.bids[i].price * 1000000)/10000
      dom.className = "up"
              dom.innerHTML= `<td class="downe bl">
            		<a href="#">
            		<div class="ty03 bl">${(data.bids[i].price*1).toLocaleString()}</div>
                <div class="ty02 bl">${dat}%</div>
            		</a>
            		</td><td class="bar bl">
            		<div class="ty01">${Math.round(data.bids[i].quantity*10000)/10000}</div>
            		</td>`;    		  
    	  
      div.append(dom);
    }
  }
  
 export default coin