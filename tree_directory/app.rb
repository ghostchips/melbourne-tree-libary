
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative 'db_config'
require_relative 'models/tree'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/location'
require_relative 'helpers'
require_relative 'sessions'
require_relative 'profile'


get '/' do
  # Display all trees from database.
  @tree = Tree.all
  erb :index
end

get '/trees/add' do
  @location = Location.all
  redirect to '/session/new' if !logged_in?
  erb :trees_add
end

post '/trees' do

  # get location id
  entry = params[:location]
  postcode = entry.delete("^0-9")
  location = Location.where(postcode: postcode)

  # Insert new tree into database
  tree = Tree.new
  tree.name = params[:name]
  tree.image_url = params[:image_url]
  tree.description = params[:description]
  tree.location_id = location.ids.first
  tree.date = Time.now.strftime("%d/%m/%Y %H:%M")
  tree.user_id = current_user.id

  # if tree.save
    redirect to '/'
  # end
end

get '/trees/:id' do
  # Display tree with corresponding id
  @tree = Tree.find(params[:id])
  @comments = Comment.where(tree_id: @tree.id)
  @user = User.all

  # Display all corresponding comments
  # if logged in, dipslay comment input box
  # if logged in as post user, display delete and edit buttons

  erb :trees_show
end

post '/trees/:id/delete' do
  # delete tree with corresponding id from database
  tree = Tree.find(params[:id])
  tree.delete
  # delete all comments with corresponding id from database
  comments = Comment.where(tree_id: tree.id)
  comments.delete_all

  redirect to '/'
end

get '/trees/edit/:id' do

  # display edit from for corresponding tree
  @tree = Tree.find(params[:id])
  @location = Location.all

  erb :trees_edit
end

post '/trees/update/:id' do

  # entry = params[:location]
  # postcode = entry.delete("^0-9")
  # location = Location.where(postcode: postcode)

  @tree = Tree.find(params[:id])

  # modify corresponding tree entry in database
  @tree.name = params[:name]
  @tree.image_url = params[:image_url]
  @tree.description = params[:description]
  # tree.location_id = location.ids.first

  # if
    @tree.save
    redirect to "/trees/#{@tree.id}"
  # end
end

get '/trees/location' do
  erb :trees_location
end

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.tree_id = params[:tree_id]
  comment.user_id = current_user.id
  comment.date = Time.now.strftime("%d/%m/%Y %H:%M")

  comment.save

  redirect to "/trees/#{comment.tree_id}"
end
