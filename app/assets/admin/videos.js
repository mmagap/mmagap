$(function() {
   //$alert()
   var mval = $('#video_category_input #video_category').val()
   
    if (mval == 'Lesson') {
        $('#video_video_link_input').hide();
        $('#video_lesson_upload_input').show();
    }else{
        
        $('#video_video_link_input').show();
        $('#video_lesson_upload_input').hide();
        $('#video_price').val('0.00')
    }
   
});    

function changeFrom(val)
{
    if (val == 'Lesson') {
        $('#video_video_link_input').hide();
         $('#video_lesson_upload_input').show();
        
    }else{
        
        $('#video_video_link_input').show();
        $('#video_lesson_upload_input').hide();
        $('#video_price').val('0.00')
    }
 }
    