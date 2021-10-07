$(function(){
	'use strict';
	//hide place holder on form focus
	$('[placeholder]').focus(function(){
		$(this).attr('data-text',$(this).attr('placeholder'));
		$(this).attr('placeholder','');
	}).blur(function(){
		$(this).attr('placeholder',$(this).attr('data-text'));
	});
	
});
//=======================================
//start loading screen
$(window).load(function()
{
	$("body").css("overflow","auto");
	$(".loading-overlay .spinner").fadeOut(2000,
	function()
	{
		$(this).parent().fadeOut(2000,
		function(){
			$(this).remove();
		});
		
	});
});
//=======================================
//img upload
function edit(input){
   if (input.files && input.files[0]) {
	   var filerdr = new FileReader();
	   filerdr.onload = function (e) {

		    $('#user_img').attr('src', e.target.result).width('100%').height('100%');
		    $('#img').attr('src', e.target.result).width('100%').height('100%');
		  
		}
		filerdr.readAsDataURL(input.files[0]);
		
	}
}



//=======================================
//caching the scroll top element
var scrollButton = $("#scroll-top");
$(window).scroll(function()
{
	$(this).scrollTop()>= 400?scrollButton.show():scrollButton.hide();
});
//click on button to scroll top
scrollButton.click(function()
{
$("html,body").animate({scrollTop:0},600);	
});

/*  Gallery lightBox
 ================================================*/ 
$(function(){

 if( $(".lightbox").length > 0 ) {

	$(".lightbox").prettyPhoto();
	
}

});