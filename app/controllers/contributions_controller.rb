class ContributionsController < ApplicationController

  # GET: /contributions
  get "/contributions" do
    erb :"/contributions/index.html"
  end

  # GET: /contributions/new
  get "/contributions/new" do
    erb :"/contributions/new.html"
  end

  # POST: /contributions
  post "/contributions" do
    redirect "/contributions"
  end

  # GET: /contributions/5
  get "/contributions/:id" do
    erb :"/contributions/show.html"
  end

  # GET: /contributions/5/edit
  get "/contributions/:id/edit" do
    erb :"/contributions/edit.html"
  end

  # PATCH: /contributions/5
  patch "/contributions/:id" do
    redirect "/contributions/:id"
  end

  # DELETE: /contributions/5/delete
  delete "/contributions/:id/delete" do
    redirect "/contributions"
  end
end
