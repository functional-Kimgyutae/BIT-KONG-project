$('.period-menu a').click(function(){
    $('.period-menu a').removeClass("on");
    $(this).addClass("on");
});

$('.pagination .num').click(function(){
    $('.pagination .num').removeClass("action");
    $(this).addClass("action");
});


$.ajax(
    {
        type:"GET",
        url:"http://34.64.56.248:3000/execution-history/admin",
        dataType:"json",
        success :  res => {
            console.log(res.data);
        },error: log =>{console.log(log)}
    }
    );