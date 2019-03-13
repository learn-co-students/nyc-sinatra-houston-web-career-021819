class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"landmarks/new"
  end

  get '/landmarks/:id/edit' do
    @landmarks = Landmark.all
    @figures = Figure.all
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks' do
    # if params[:landmark][:name] = ""
    #   raise "Enter a name for your landmark!"
    # else
    #   @landmark = Landmark.create(params[:landmark])
    # end
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end

