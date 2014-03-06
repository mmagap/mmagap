module ApplicationHelper
  def flash_class(type)
    if  :notice 
      type = 'alert-info'
    elsif :alert
      type= 'alert-error'
    else 
      type=""
    end
  end
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  

  #checks if given string is url
  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def get_image user
    img_url = user.facebookimage_url ? user.facebookimage_url : user.image_url
    if uri? img_url #checks if external file link is avaliable
      #define load timeout
      url = URI.parse(img_url)
      http = Net::HTTP.new(url.host, url.port)
      #check if image is under ssl
      if url.scheme == 'https'
        http.use_ssl = true
        #http.use_ssl = false
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      http.read_timeout, http.open_timeout = 1
      res = http.start() {|http| http.get(url.path)}
      img_url = 'no_avatar.jpg' unless res.code.to_i >= 200 && res.code.to_i < 400 #good codes will be betweem 200 - 399
    end
    img_url ||= 'no_avatar.jpg' #if execution of first line => nil, make it default
  end

  # user_signed_in and current_user == user
  def is_signed_in_this? user
    if user_signed_in?
      current_user == user
    else
      false
    end
  end
  

  
  def show_field_error(model, field)
    s=""

    if !model.errors[field].empty?
      s =
        <<-EOHTML
           <div id="error_message">
             #{model.errors[field][0]}
           </div>
        EOHTML
    end

    s.html_safe
  end
  

end
