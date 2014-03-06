# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('#header-desc').delegate "#new_like_button", "click", ->
    form = $(this).find("#new_like")
    $.post form.attr("action"), form.serialize(), ((data, textStatus, xhr) ->
      if data == 'false'
        $("#new_like_button").find('#rgt').html('<img alt="success" src="/assets/no200.png" style="width: 20px; height: 20px;">')
      else
        $("#new_like_button").replaceWith('<a href="/likes/'+data+'" data-method="delete" id="delete_like" rel="nofollow"><div id="rgt" class="btn btn-info"><img alt="200ok" src="/assets/200ok.png" height="20" width="20"> </div></a>')
    ), "script"
  $('.reply').on 'click', (e)-> #reply on the comment
    e.preventDefault()
    $("html, body").animate
      scrollTop: $(document).height()
    , 1000
    $('#comment_commentable_id').val($(this).attr('data_value'))
    $('#comment_commentable_type').val('Comment')
    $('#comment-header').html($(this).attr('data_user_info'))
  $('.comment-like').on 'click', (e)-> #comment like
    e.preventDefault()
    l_or_n = $(this).attr('data_like')
    id = $(this).attr('data_id')
    user_id = $(this).attr('data_user_id')
    parent_l = $(this).parent().find('.like-count')
    parent_n = $(this).parent().find('.dethlike-count')
    $.post $(this).attr('data_send_to'), {comment_like: { comment_id: id, like_or_not: l_or_n, user_id: user_id}}, ((data, textStatus, xhr) ->
      if data == 'true'
        parent_l.html(parseInt(parent_l.html()) + 1)
      else if data == 'false'
        
        parent_n.html(parseInt(parent_n.html()) + 1)
      else
    ), 'script'