
get '/profile/:id' do

  @user = User.find(params[:id])

  erb :profile
end
