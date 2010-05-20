class UserController < ApplicationController
  before_filter :check_authentication, :except => [:signin, :signin_form]
  def check_authentication
    unless session[:user]
      session[:intended_action] = action_name
      redirect_to :action => "signin_form"
    end
  end

  def signin
    session[:user] = User.authenticate(params[:username], params[:password]).id
    redirect_to :action => session[:intended_action]
  end

  def signout
    session[:user] = nil
    redirect_to :action => "signin_form"
  end
end
