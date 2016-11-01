
require 'sinatra'
require 'sinatra/reloader'

require_relative 'db_config'
require_relative 'models/tree'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/location'


get '/login' do

  # display login page if not logged in
  # erb :login
end

get '/' do

  # Display all trees from database.
  @tree = Tree.all

  # Display logged in/out status
  # if logged in, dipslay new entry button
  erb :index
end

get '/trees/add' do

  @location = Location.all
  # Display tree entry from
  # If not logged in, redirect to log in page.

  erb :trees_add
end

post '/trees' do

  # Insert new tree into database
  @tree = Tree.new
  @tree.name = params[:name]
  @tree.image_url = params[:image_url]
  @tree.description = params[:description]
  # @tree.location = # params[:location]
  # @tree.date = # date of when posted
  # @tree.user_id = # id of current user
  # @tree.user_photo = # user photo of current user
  @tree.save

  redirect to '/'
end

get '/trees/:id' do

  # Display tree with corresponding id
  @tree = Tree.find(params[:id])
  @comments = Comment.where(tree_id: @tree.id)

  # Display all corresponding comments
  # if logged in, dipslay comment input box
  # if logged in as post user, display delete and edit buttons

  erb :trees_show
end

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.tree_id = params[:tree_id]
  comment.save
  redirect to "/trees/#{comment.tree_id}"
end

post '/trees/:id/delete' do

  tree = Tree.find(params[:id])
  comment = Comment.where(tree_id: @tree.id)
  tree.delete
  comment.delete

  # delete tree with corresponding id from database

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
