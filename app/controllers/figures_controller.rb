require 'pry'
class FiguresController < ApplicationController
  # add controller methods

   #From update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end


  #### Create
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
   
  if params[:landmark][:name]!= nil && params[:landmark][:year_completed]!= nil
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  end

    redirect "/figures/#{@figure.id}"
  end


  ### Read
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/show_all'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end



  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name]!=nil && params[:landmark][:name]!=nil && params[:landmark][:year_completed]!=nil
      new_title = Title.create(params[:title])
      new_landmark = Landmark.create(params[:landmark])
      @figure << new_title
      @figure << new_landmark
    end
    redirect "/figures/#{@figure.id}"
  end
end


