class LandmarksController < ApplicationController
  set :views, 'app/views/landmarks'
  set :method_override, true

    get '/landmarks/new' do
      @figures = Figure.all
      erb :new
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @figures = Figure.all
      erb :show
    end

    get '/landmarks' do
      @landmarks = Landmark.all
      erb :show_all
    end

    post '/landmarks' do
      land = Landmark.create(params[:figure])
      if params[:figure][:name] != ""
        new_figure = Figure.create(params[:figure])
        land.figures << new_figure
      end
      land.save
      redirect "/landmarks/#{land.id}"
    end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      @figures = Figure.all
      erb :edit
    end

    patch '/landmarks/:id' do
      land = Landmark.find(params[:id])
      land.update(params[:landmark])
      if params[:figure][:name] != ""
        new_figure = Figure.create(params[:figure])
        land.figures << new_figure
      end
      land.save
      redirect "/landmarks/#{land.id}"
    end

end
