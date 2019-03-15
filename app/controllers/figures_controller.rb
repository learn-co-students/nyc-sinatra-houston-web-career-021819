require 'pry'

class FiguresController < ApplicationController
  # add controller methods

  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure_titles = FigureTitle.all
    erb :new
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :edit
  end

  get '/figures/:id' do
    @figures = Figure.all
    @figure = Figure.find(params[:id])
    erb :show
  end


  post '/figures' do

    @figure = Figure.create(params[:figure])

    unless params[:title][:name].empty?
      @title = Title.create(params[:title])
      FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.update(figure_id: @figure.id)
    end

    redirect "/figures"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure_title = FigureTitle.find(figure_id: @figure.id)
    @figure_title.update(figure_id: @figure.id)

    redirect "/figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.delete
    redirect "/figures"
  end

end
