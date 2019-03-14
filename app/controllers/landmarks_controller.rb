require 'pry'
class LandmarksController < ApplicationController
  # add controller methods

  ### From Update
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end


  ### Creat
  get '/landmarks/new'do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @landmark = Landmark.create(params[:landmark])
    end
    redirect '/landmarks'
  end 
  
  ### Read
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/show_all'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  ### Update
  #get '/landmarks/:id/edit' do
   # @landmarks = Landmark.all
    #erb :'/landmarks/edit'
  #end

  patch '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end
end
