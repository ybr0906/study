$(document).ready(function(){
    $('.searchArea').on('click', function(){
        $(this).addClass('click');
        $(this).children('a').addClass('close');
    });


    $('.searchArea .close').on('click', function(){
        console.log('on');
        $(this).removeClass('close');
        $('.searchArea').removeClass('click');
    });
});