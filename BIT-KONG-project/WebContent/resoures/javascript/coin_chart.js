let chartData;
let se;
function callChart(day,coin) {
  const options = {method: 'GET', headers: {accept: 'application/json'}};
  if(se != null) {clearInterval(se)}
  fetch(`https://api.bithumb.com/public/candlestick/${coin}_KRW/${day}`, options)
    .then(response => response.json())
    .then(response => draw(process(response.data)))
    .catch(err => console.error(err)); 
  se = setInterval(() => {
    fetch(`https://api.bithumb.com/public/candlestick/${coin}_KRW/${day}`, options)
    .then(response => response.json())
    .then(response => draw(process(response.data)))
    .catch(err => console.error(err));     
  }, 1000);
}
function process(dataList) {
let list = []
for(let i = dataList.length-50; i < dataList.length;i++){
    let item = dataList[i]
    let obj = {};
    let da = new Date(item[0])
    da.setHours(da.getHours() + 9);
    obj.x = da;
    obj.y = [item[1],item[3],item[4],item[2]]
    list.push(obj);
}
return list
}
function draw(itemList){
if(chartData == null){
    let options = {
      series: [{
        data:itemList
    }],
      chart: {
      type: 'candlestick',
      height: 350,
      toolbar: {
        show:false,
      },
    },
    plotOptions: {
      candlestick: {
        colors: {
          upward: '#d23c4b',
          downward: '#1e5fd2'
        }
      }
    },
    xaxis: {
      type: 'datetime'
    },
    yaxis: {
      tooltip: {
        enabled: true
      }
    }
    };
    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chartData = chart
    chartData.render();
}else {
    chartData.updateSeries([{data:itemList}]);
}
}

export default callChart
