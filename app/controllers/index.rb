# home page
get '/' do
  if session[:user_id]
    erb :_header
  end
  erb :index
end


post '/login' do
  @user = User.find_by_username (params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    current_user
    redirect '/'
  else
    # flash[:login] = "We couldn't find username or password."
    redirect '/'
  end
end

post '/signup' do
  @user = User.create(params)
  session[:user_id] = @user.id
  current_user
  redirect '/'

end

#user's profile page
get '/users/:id' do
  @profile = User.find(params[:id])
  if session[:user_id]
    erb :_header
  end
  erb :user_profile
end

get '/logout' do
  session.clear
  redirect '/'
end

# needs work
get '/surveys/:id/edit' do
  if session[:user_id]
    erb :_header
  end
  erb :edit_survey_form
end

#needs work
post '/surveys/:id/edit' do

end

get '/surveys/create' do
  # if session[:user_id] != nil
    erb :_header
  # end
  erb :survey_form
end

post '/surveys/create' do
  parse_survey_params(params)
  redirect'/'
end

get '/surveys/:id/take' do
  if session[:user_id]
    erb :_header
  end
  @survey = Survey.find(params[:id])
  erb :take_survey
end

post '/results/create' do
  Response.create(choice_id: @params["answer"], user_id: session[:user_id])

end

get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  erb :results
end

# get '/' do
#   redirect '/posts'
# end

# get '/posts' do
#   @posts = Post.all
#   erb :index
# end

# get '/posts/:id/vote' do
#   post = Post.find(params[:id])
#   post.votes.create(value: 1)
#   # redirect "/posts"
#   { points: post.points, post_id: post.id}.to_json
# end

# delete '/posts/:id' do
#   post = Post.find(params[:id])
#   post_id = post.id
#   post.destroy
#   { post_id: post_id}.to_json
# end

# post '/posts' do
#   post = Post.create( title: params[:title],
#                       username: Faker::Internet.user_name,
#                       comment_count: rand(1000) )
#   erb :_post_container
#   { post_id: post.id, points: post.points, timestamp: post.time_since_creation, author: post.username, comments: post.comment_count }.to_json

# end

# get '/post/:id' do
#   @post = Post.find(params[:id])
#   erb :post
# end
