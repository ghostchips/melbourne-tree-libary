

# Hayek
#http://economicstudents.com/wp-content/uploads/2013/05/3845_friedrich-hayek-1330309138.jpg

# Cedar Tree
#https://upload.wikimedia.org/wikipedia/commons/b/b8/Cedar_Tree_(7853418286).jpg

#Great visual and sound barrier




























helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
