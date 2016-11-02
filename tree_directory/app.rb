
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

  # Insert new tree into database
  tree = Tree.new
  tree.name = params[:name]
  tree.image_url = params[:image_url]
  tree.description = params[:description]
  tree.location = params[:location]
  # tree.date = # date of when posted
  tree.user_id = current_user.id
  tree.save

  redirect to '/'
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

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.tree_id = params[:tree_id]
  comment.user_id = current_user.id
  comment.save

  redirect to "/trees/#{comment.tree_id}"
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

  @tree = Tree.find(params[:id])

  # modify corresponding tree entry in database
  @tree.name = params[:name]
  @tree.image_url = params[:image_url]
  @tree.description = params[:description]
  @tree.save

  redirect to "/trees/#{@tree.id}"

end

get '/trees/location' do

  erb :trees_location
end
