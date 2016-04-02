class PlanController < ApplicationController

  get '/plans/new' do
    if logged_in?
      erb :'plans/new'
    else
      redirect '/login'
    end
  end

  post '/plans/new' do
    if params[:goal].any? {|key,value| value.empty?}
      @plan = Plan.create(params[:plan])
    else
      goal = Goal.create(params[:goal])
      params[:plan][:goal_id] = goal.id
      @plan = Plan.create(params[:plan])
      current_user.goals << goal
    end
    redirect "/goals/#{@plan.goal_id}"
  end


  get '/plans/:id/edit' do
    @plan = Plan.find_by(id: params[:id])
    if logged_in? && current_user.goals.any? {|goal| goal.plans.include?(@plan)}
      erb :'plans/edit'
    elsif logged_in?
      redirect "/#{current_user}"
    else
      redirect '/login'
    end
  end

  patch '/plans/:id/edit' do
    @plan= Plan.find_by(id: params[:id])
    if params[:goal].any? {|key,value| value.empty?}
      @plan.update(params[:plan])
    else
      goal = Goal.create(params[:goal])
      params[:plan][:goal_id] = goal.id
      @plan.update(params[:plan])
      current_user.goals << goal
    end
  redirect "/goals/#{@plan.goal_id}"
  end

  get '/plans/:id/delete' do
    @plan = Plan.find_by(id: params[:id])
    if logged_in? && current_user.goals.any? {|goal|      goal.plans.include?(@plan)}
      @plan.delete
      redirect "/goals/#{@plan.goal_id}"
    elsif logged_in?
      redirect "/#{current_user}"
    else
      redirect '/login'
    end
  end
end
