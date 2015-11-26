module ApplicationHelper

  def error_messages_for(object)
  	render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def user_signed_in?
    unless session[:user_id]
      return false
    else
      return true
    end
  end

end
