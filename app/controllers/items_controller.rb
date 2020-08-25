class ItemsController < ApplicationController

  # GET: /items
  # get "/items" do
  #   erb :"/items/index.html"
  # end

  # GET: /items/new
  # get "/items/new" do
  #   erb :"/items/new.html"
  # end

  # POST: /items
  post "/items" do
    @item = Item.create(
      :title => params[:title], 
      :content => params[:content],
      :list => List.find_by_id(request.referrer.split("/").last),
      :user => current_user,
      :aquired => false
    )
    redirect "/#{request.referrer.split("/")[-2..-1].join("/")}"
  end

  # GET: /items/5
  # get "/items/:id" do
  #   erb :"/items/show.html"
  # end

  # GET: /items/5/edit
  # get "/items/:id/edit" do
  #   erb :"/items/edit.html"
  # end

  # PATCH: /items/5
  # patch "/items/:id" do
  #   redirect "/items/:id"
  # end

  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    @item = Item.find_by_id(params[:slug])
    @list = @item.list
    binding.pry
    @item.destroy
    redirect "/lists/#{@list.id}"
  end
end
