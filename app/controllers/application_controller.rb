class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_goals"
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      # how would teach this method to find the user or return the previously found user
      # on the first call of this method in a request cycle hit the DB
      # on the next call of this method, just return the previouly found one.
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def login(params)
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end

    def logout
      session.clear
    end
  end
end
