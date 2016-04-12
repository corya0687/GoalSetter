class GoalController < ApplicationController
  get '/goals' do
    if logged_in?
      @name = current_user.username
      erb :'goals/index'
    else
      redirect '/login'
    end
  end

  get '/goals/new' do
    puts @hello
    if logged_in?
      erb :'goals/new'
    else
      redirect '/login'
    end
  end

  post '/goals/new' do
    new_goal = current_user.goals.build(params)
    new_goal.save
    redirect "/goals/#{new_goal.id}"
  end

  get '/goals/:id' do
    @goal = Goal.find_by(id: params[:id])
    if logged_in? && current_user.goals.any? {|goal| @goal == goal }
      erb :'goals/show'
    else
      redirect "/#{current_user}"
    end
  end

  get '/goals/:id/edit' do
    @goal = Goal.find_by(id: params[:id])
    if logged_in? && current_user.goals.any? {|goal| @goal == goal }
      erb :'goals/edit'
    else
      redirect "/#{current_user}"
    end
  end

  patch '/goals/:id/edit' do
    @goal = Goal.find_by(id: params[:id])
    @goal.name = params[:name]
    @goal.description = params[:description]
    @goal.deadline = params[:deadline]
    @goal.save
    redirect "/goals/#{@goal.id}"
  end

  get '/goals/:id/delete' do
    @goal = Goal.find_by(id: params[:id])
    if logged_in? && current_user.goals.any? {|goal| @goal == goal }
      @goal.delete
    end
    redirect "/#{current_user}"
  end
end
