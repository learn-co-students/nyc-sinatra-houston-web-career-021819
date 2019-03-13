class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id/edit' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    # if params[:figure][:name] = ""
    #   raise "Enter a name for your figure!"
    # else
    #   @figure = Figure.create(params[:figure])
    # end
    @figure = Figure.create(params[:figure])

    if params[:title][:name] != ""
      new_title = Title.create(params[:title])
      @figure.titles<<new_title
    end
    
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks<<new_landmark
    end
    
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if params[:title][:name] != ""
      new_title = Title.create(params[:title])
      @figure.titles<<new_title
    end
    
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks<<new_landmark
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
