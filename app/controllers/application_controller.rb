require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # set :session_secret, ENV.fetch('APP_SESSION_SECRET')
    set :session_secret, 'APP_SESSION_SECRET'
  end

  get "/" do
    unauthorized_redirect
    authorized_redirect
  end
  
  get "/join" do
    authorized_redirect
    erb :"/app/sign_up"
  end
  
  post "/join" do
    if !User.find_by_username(params[:username])
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect "/"
    end
  end
  
  get "/login" do
    authorized_redirect
    erb :"/app/login"
  end
  
  post "/login" do
    if !params.any?.nil?
      @user = User.find_by_username(params[:username])
      if !!@user
        if @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        else
          redirect "/login"
        end
      else
        redirect "/join"
      end
    end
  end

  post "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/login"
    end
  end
# -----------------------------------------------------------
# -----------------------------------------------------------
# Helpers
# TODO redirect_if_not_logged_in
# -----------------------------------------------------------
  def unauthorized_redirect
    if !logged_in?
      redirect "/login"
    end
  end

  def authorized_redirect
    if logged_in?
      redirect "/users/#{current_user.id}"
    end
  end

  def current_user
    if logged_in?
      User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
