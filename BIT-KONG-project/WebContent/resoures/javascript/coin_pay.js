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
        `<div class="price-point">
                <div class="pay-money">
                    <span class="moneys">${price_list[i].price}</span><span class="name">${price_list[i].unit}</span>
                </div>
                <div class="price">
                    <span>${price_list[i].pay}원</span>
                </div>
            </div>`;
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
    document.querySelector(".payment").innerHTML = 
    `<span>결제 금액 : ${item.pay}원</span>
    <span>충전 금액 : ${item.price}${item.unit}</span>
    <span>결제일 : ${year}-${month}-${date}</span>
    <span>고맙습니다 사랑합니다.</span>`;
}

document.querySelector(".dongeham").addEventListener("click",(e)=> {
    {
        isAgree = !isAgree;
        console.log(e);
        if(isAgree){
            e.target.innerHTML = "동의한다."
        }else {
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
            url:"http://34.64.56.248:3000/",
            data: ob,
            dataType:"json",
            success :  res => {
                console.log("결제 완료.");
                alert("결제가 완료되었습니다.");
                location.href = "/index";
            },error: log =>{console.log("실패"+log)}
        }		
    )
}