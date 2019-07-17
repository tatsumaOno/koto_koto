$(document).on('turbolinks:load',function(){
	  $('.mypage_sec_l_tags li').click(function(){
		var index = $('.mypage_sec_l_tags li').index(this);
		$('.mypage_sec_l_tablelist').removeClass('show').eq(index).addClass('show');
	  });
});