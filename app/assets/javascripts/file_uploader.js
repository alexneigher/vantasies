$(function(){
  $(".js_edit_photos").on('change', 'input', function(){
    $(this).parent('form').find('.submit-btn').click();
    $(this).parent('form').prepend("Working...");
  });

})


