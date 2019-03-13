class FiguresController < ApplicationController
  set :views, 'app/views/figures'
  set :method_override, true

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :show
  end

  get '/figures' do
    @figures = Figure.all
    erb :show_all
  end

  post '/figures' do
    fig = Figure.create(params[:figure])
    if params[:title][:name] != ""
      new_title = Title.create(params[:title])
      fig.titles << new_title
    end
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(params[:landmark])
      fig.landmarks << new_landmark
    end
    fig.save
    redirect "/figures/#{fig.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :edit
  end

  patch '/figures/:id' do
    fig = Figure.find(params[:id])
    fig.update(params[:figure])
    if params[:title][:name] != ""
      new_title = Title.create(params[:title])
      fig.titles << new_title
    end
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(params[:landmark])
      fig.landmarks << new_landmark
    end
    fig.save
    redirect "/figures/#{fig.id}"
  end

end
