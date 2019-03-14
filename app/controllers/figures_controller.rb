class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @figures = Figure.all
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  #read
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  #create
  post '/figures' do
    @figure = Figure.create(params["figure"])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name:params[:landmark])
    end
    redirect "/figures/#{@figure.id}"
  end

  #update.
    patch '/figures/:id' do
      @figure = Figure.find(params[:id])

      landmark_arr_belongs_to_figure = Landmark.all.each { | landmark | landmark.figure_id == @figure.id}

      lm_names = landmark_arr_belongs_to_figure.collect { | x | x.name } 
      input_name = params["figure"]["name"]
      input_landmark = params["landmark"]["name"]

        if input_name != @figure.name 
          @figure.name = input_name
          @figure.update(params["figure"])
        end
        if lm_names.include?(input_landmark) == false
          @figure.landmarks << Landmark.create(name:params[:landmark][:name])
          @figure.update(params["figure"])
        end
      redirect "/figures/#{@figure.id}"
    end
  
    #delete
    delete '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.delete
      redirect "/figures"
    end

end
