enable :sessions

get '/session/new' do
  erb :session_new
end

post '/session' do
  user = User.find_by(email: params[:email])
  # session[:last_url] = request.referer

  if user && user.authenticate(params[:password])
    # you are fine, let me create a session for you
    session[:user_id] = user.id
    # redirect to session[:last_url]
    redirect to "/profile/#{user.id}"
  else
    #who are you
    erb :session_new
  end

end

delete '/session' do
  # remove the session
  session[:user_id] = nil
  redirect to '/session/new'
end

post '/session/create' do

  erb :session_create
end

post '/session/create/new' do
  user = User.new
  user.username = params[:username]
  user.email = params[:email]
  user.password = params[:password]
  user.date = Time.now.strftime("%d/%m/%Y")

  # if
    user.save
    session[:user_id] = user.id
    redirect to "/profile/#{user.id}"
  # end
end

get '/profile/edit/:id' do
  @user = User.find(params[:id])
  @location = Location.all

  erb :profile_edit
end

post '/profile/update/:id' do

  entry = params[:location]
  postcode = entry.delete("^0-9")
  location = Location.where(postcode: postcode)
  @user = User.find(params[:id])
  @user.email = params[:email]
  @user.bio = params[:bio]
  @user.photo = params[:photo]
  @user.location_id = location.ids.first

  # if
    @user.save
    redirect to "/profile/#{ @user.id }"
  # end
end
