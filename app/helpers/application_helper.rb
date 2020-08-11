module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   # memoization if current_user does not exist it will hit DB once and save the instance
  end

  def logged_in?
    !!current_user       # !! is used to turn to boolean values true or false
  end

end
