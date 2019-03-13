class LandmarksController < ApplicationController
  # add controller methods
  set :views, 'app/views/landmarks'
  set :method_override, true

#Interface (Forms)
  get '/landmarks/new' do
    erb :new
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

#Read
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

#create
  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    redirect '/landmarks'
  end

#update
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end

#delete
  delete '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.delete
    redirect '/landmarks'
  end

end
