class ItemsController < ApplicationController
  # POST: /items
  post "/items" do
    @item = Item.create(
      :title => params[:title], 
      :content => params[:content],
      :list => List.find_by_id(request.referrer.split("/").last),
      :user => current_user,
      :acquired => false
    )
    redirect "/#{request.referrer.split("/")[-2..-1].join("/")}"
  end
  
  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    @item = Item.find_by_id(params[:id])
    @list = @item.list
    @item.destroy
    redirect "/lists/#{@list.id}"
  end

  # PATCH: MARK ITEM AS ACQUIRED
  patch "/items/:id" do
    @item = Item.find_by_id(params[:id])
    @item.update(:acquired => True)
    redirect back
  end

  # PATCH: change an item's details
  # patch "/items/:id" do
  #   redirect "/items/:id"
  # end
end
  
  # GET: /items
  # get "/items" do
  #   erb :"/items/index.html"
  # end

  # GET: /items/new
  # get "/items/new" do
  #   erb :"/items/new.html"
  # end

  # GET: /items/5
  # get "/items/:id" do
  #   erb :"/items/show.html"
  # end

  # GET: /items/5/edit
  # get "/items/:id/edit" do
  #   erb :"/items/edit.html"
  # end

