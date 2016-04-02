class UserController < ApplicationController
  get '/' do
    if logged_in?
      redirect "/#{current_user.username}"
    else
      erb :index
    end
  end

  get '/signup' do
    if logged_in?
      redirect "/#{current_user}"
    else
      erb :'users/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/#{current_user}"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    if !(params.any? {|input,value| input.empty?})
      login(params)
      redirect "/#{current_user}"
    else
      redirect '/login'
    end
  end


  post '/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/#{@user.username}"
  end

  get '/logout' do
    logout
    redirect '/login'
  end

  get '/:user' do
    if logged_in?
      erb :'users/profile'
    else
      redirect '/login'
    end
  end

end
