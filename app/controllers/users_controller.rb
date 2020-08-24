class UsersController < ApplicationController

  # GET: /users
  # get "/users" do
  #   unauthorized_redirect

  #   erb :"/users/index.html"
  # end

  # GET: /users/5
  get "/users/:id" do
    unauthorized_redirect
    @user = User.find_by_id(params[:id])
    if current_user == @user
      @admin_lists = @user.lists.filter {|list| list.get_role(@user) == "admin" }
      @guest_lists = @user.lists.filter {|list| list.get_role(@user) != "admin" }
      erb :"/users/show.html"
    else
      redirect "/login"
    end
  end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end

  # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end
end
