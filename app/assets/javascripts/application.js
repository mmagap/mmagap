// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_self
//= require jquery.uploadify.min.js
$(document).ready(function(){
  $('.like-finger').click(function(){
    $(this).parent().parent().find('.like-finger').addClass('has-ben-liked')
    if($(this).hasClass('like-finger')){
      $(this).addClass('this_value');
    }
    $(this).parent().parent().find('.like-finger').removeClass('like-finger');
  });

  $('.content').delegate('#find-user-by-email input', 'keyup', function () {
    $.get($('#find-user-by-email').attr('action'), $('#find-user-by-email').serialize(), null, 'script');
    return false;
  });

  $('.content').delegate("#follow_user_link", 'click', function(){
    $('#follow_user_link').show();
    $('#new-conversation-form').remove();
    $('.removable-c-link').removeClass('removable-c-link');
    $(this).addClass('removable-c-link');
  });

  //diseable text are for show
  $('.s-t-show-g-class').prop("disabled", true);

  //tags search logic
  $('.tag-search-input').on('keyup', function(){
    var tr = $(this).parent().parent().parent().parent().find('tbody tr'),
        regex = $(this).val()
    console.log(tr);
    console.log(regex);
    tr.removeClass('hidden-tag');
    tr.each( function( index ){
      if (!$(this).find('.tag-link').text().match(regex)){
        $(this).addClass('hidden-tag');
      }
    });
  });
 
});


