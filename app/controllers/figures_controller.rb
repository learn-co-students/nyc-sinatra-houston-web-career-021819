class FiguresController < ApplicationController
  # add controller methods
  set :views, 'app/views/figures'
  set :method_override, true

#Interface (Forms)
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :new
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :edit
  end

#Read
  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :show
  end

#create
  post '/figures' do
    @figure = Figure.create(params["figure"])
    if params["title"]["name"] == "" && params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |id|
        @figure_title = FigureTitle.create(figure_id: @figure.id, title_id: id)
      end
    else
      @title = Title.create(params["title"])
      @figure_title = (FigureTitle.create(figure_id: @figure.id, title_id: @title.id))
    end

    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"], figure_id: @figure.id)
    else
      params["figure"]["landmark_ids"].each do |landmark|
        @landmark = Landmark.find(landmark.to_i)
        @landmark.figure_if = @figure.id
      end
    end
redirect "/figures/#{@figure.id}"
  end

#update
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"], figure_id: @figure.id)

    else
      params["figure"]["landmark_ids"].each do |landmark|
        @landmark = Landmark.find(landmark.to_i)
        @landmark.figure_if = @figure.id
      end
    end

    redirect "/figures/#{@figure.id}"
  end

#delete
  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.delete
    redirect '/figures'
  end

end
