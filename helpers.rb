
helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end



# Cedar Tree

# Profile Photo
#http://bjstlh.com/data/wallpapers/65/WDF_1102596.jpg
#Tree Photo

#https://upload.wikimedia.org/wikipedia/commons/b/b8/Cedar_Tree_(7853418286).jpg

#Great visual and sound barrier
