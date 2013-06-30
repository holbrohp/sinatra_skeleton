helpers do
  def login(params)
    if @user.password == params[:password]
      session[:user] = @user.id
      redirect to("/user/#{@user.id}")
    else
      erb :index
    end
  end
end
