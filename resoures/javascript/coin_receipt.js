$('.period-menu a').click(function(){
    $('.period-menu a').removeClass("on");
    $(this).addClass("on");
});

$('.pagination .num').click(function(){
    $('.pagination .num').removeClass("action");
    $(this).addClass("action");
});
