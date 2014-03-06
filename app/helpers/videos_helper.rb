module VideosHelper

  def recursive_comments comment, temp, content
    temp += 10
    comment.comments.each do |comment|
      content += render(:template =>"comments/comment", :layout => nil , :locals => { comment: comment, temp: temp }).to_s
      content += recursive_comments(comment, temp, "") unless comment.comments.empty?
    end #comment.each do |comment|
    return content
  end

end
