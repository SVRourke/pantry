class FriendshipsController < ApplicationController

  # GET: /friends
  get "/friends" do
    erb :"/friends/index.html"
  end

  # GET: /friends/new
  get "/friends/new" do
    erb :"/friends/new.html"
  end

  # POST: /friends
  post "/friends" do
    @user = User.find_by_username(params[:username])
    redirect "/friends"
  end

  # GET: /friends/5
  get "/friends/:id" do
    erb :"/friends/show.html"
  end

  # GET: /friends/5/edit
  get "/friends/:id/edit" do
    erb :"/friends/edit.html"
  end

  # PATCH: /friends/5
  patch "/friends/:id" do
    redirect "/friends/:id"
  end

  # DELETE: /friends/5/delete
  delete "/friends/:id/delete" do
    redirect "/friends"
  end
end
