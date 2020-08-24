class ListsController < ApplicationController

  # GET: /lists
  get "/lists" do
    erb :"/lists/index"
  end

  # GET: /lists/new
  get "/lists/new" do
    erb :"/lists/new"
  end
  
  # POST: /lists
  post "/lists" do
    @list = List.create_as_admin(current_user.id, params[:name], params[:content])
    redirect "/lists/#{@list.id}"
  end
  
  # GET: /lists/5
  get "/lists/:id" do
    @list = List.find_by_id(params[:id])
    @role = current_user.contributions.find {|c| c.list == @list}.role
    erb :"/lists/show.html"
  end

  # # GET: /lists/5/edit
  # get "/lists/:id/edit" do
  #   erb :"/lists/edit.html"
  # end

  # # PATCH: /lists/5
  # patch "/lists/:id" do
  #   redirect "/lists/:id"
  # end

  # # DELETE: /lists/5/delete
  # delete "/lists/:id/delete" do
  #   redirect "/lists"
  # end
end
