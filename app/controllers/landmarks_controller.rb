class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :"landmarks/new"
  end

#read
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

#create
  post '/landmarks' do
    Landmark.create(params[:id])
    redirect "/landmarks"
  end

#update
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    hash = {}
    hash[:name] = params[:name]
    hash[:year_completed] = params[:year_completed]
    @landmark.update(hash)
    redirect "/landmarks/#{@landmark.id}"
  end

end
