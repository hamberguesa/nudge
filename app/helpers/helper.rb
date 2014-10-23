helpers do
  def current_user
    if session[:user_id]
     @current_user ||= User.find(session[:user_id])
    end
  end

  def no_user_redirect
    redirect '/' if current_user.nil?
  end

  def delete_nudge_button(nudge_id)
  	erb :_delete_nudge_button, locals: { id: nudge_id }
  end

  def header
    erb :_header
  end

  def login_header
    erb :_loginheader
  end
end