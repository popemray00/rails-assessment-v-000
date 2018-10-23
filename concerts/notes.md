def login
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    flash[:success] = "Successfully logged in!"
    session[:user_id] = @user.id
    redirect_to user_concerts_path(@user)
  else
    flash[:notice] = "Invalid username or password"
    render :new
  end
  end



Cannot find age in github

remove from sign in form

add a scope to purchaseticket
