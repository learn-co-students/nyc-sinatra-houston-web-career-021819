require 'pry'
class LandmarksController < ApplicationController
  # add controller methods
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])

    unless params[:figure][:name].empty?
      Figure.create(params[:figure])
    end

    redirect "/landmarks"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.destroy
    redirect "/landmarks"
  end

end
