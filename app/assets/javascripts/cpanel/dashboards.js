$(".menu-nav > li").click(function(){
	$(this).addClass('menu-active')
       .siblings()
       .removeClass('menu-active');
});
