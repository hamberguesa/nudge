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
    flash[:notice] = "Login failed. Please try again."
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
  else
    flash[:notice] = "Incorrect password"
    redirect '/'
  end

  if @user.id.nil?
    flash[:notice] = "Username or email already taken"
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
  Nudge.create(receiver_name: params[:receiver_name], phone_num: params[:phone_num], message: params[:message], date: params[:date], time: params[:time], user_id: @user.id)

  # redirect '/nudges/:id'
end

# thank you page 
get '/nudges/:id' do
  @nudge = Nudge.find(params[:id])

  erb :nudges_confirm
end

# all of a user's nudges

get '/user/:id/nudges' do
  @user = User.find(params[:id])

  erb :profile
end

# logout
get '/logout' do
  session.clear
  redirect '/'
end
