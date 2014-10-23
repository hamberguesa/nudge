# homepage - login/signup

get '/' do
  if current_user.nil?
    erb :home
  else
    redirect '/nudges'
  end
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if !@user.nil? && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/nudges'
  else
    # flash[:notice] = "Login failed. Please try again."
    redirect '/'
  end
end

post '/signup' do
  if params[:password] == params[:verify_password]
    @user = User.create({
      name: params[:name],
      username: params[:username],
      password: params[:password], 
      email: params[:email]
      })
    redirect '/nudges'
  else
    # flash[:notice] = "Signup failed. Please try again."
    redirect '/'
  end

  if @user.id.nil?
    # flash[:notice] = "Username or email already taken."
    redirect '/'
  else
    session[:user_id] = @user.id
    redirect '/nudges'
  end
end

# Nudge form

get '/nudges' do
  @user = current_user

  erb :nudges
end

post '/nudges/create' do
  @user = current_user

  phone_num = '+1' + params[:phone_num]
  time = params[:hours] + ':' + params[:minutes] + ':00'
  datetime = params[:date] + " " + time

  nudge = Nudge.create!(receiver_name: params[:receiver_name], phone_num: phone_num, message: params[:message], datetime: datetime, user_id: @user["id"])

  content_type :json
  nudge.to_json
  # redirect '/nudges'
  # redirect "/nudges/#{nudge.id}"
end

# thank you page - Not needed now thanks to AJAX

# get '/nudges/:id' do
#   @nudge = Nudge.find(params[:id])

#   erb :nudges_confirm
# end

# Profile - all of a user's nudges

get '/user/:id/nudges' do
  @user = User.find(params[:id])
  @nudges = Nudge.where(user_id: params[:id]) 

  erb :profile
end

# Delete

delete '/nudges/:id' do
  @nudge = Nudge.find(params[:id]).destroy
  user = User.find_by(id: @nudge.user_id)

  redirect "/user/#{user.id}/nudges"
end

# Logout

get '/logout' do
  session.clear
  redirect '/'
end
