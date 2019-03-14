require 'pry'
class FiguresController < ApplicationController
  set(:views, "app/views/figures")


  #Create
  get '/figures/new' do
      erb :new
  end
  post '/figures' do
      new_figure = Figure.create(params[:figure])
    unless params[:landmark][:name].empty? && params[:landmark][:year_completed].empty?
      new_landmark = Landmark.create(params[:landmark])
      new_landmark.update(figure_id: new_figure.id)
    end
    unless params[:title][:name].empty?
      new_title = Title.create(params[:title])
      FigureTitle.create(figure_id: new_figure.id, title_id: new_title.id)
    end
#    binding.pry
      redirect "/figures"
  end

  #Read
     get '/figures' do
         @figures = Figure.all
         erb :index
     end

     get '/figures/:id' do
          @figure = Figure.find(params[:id])
          erb :show
      end



  #Update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id].to_i)
#    binding.pry
    erb :edit
  end
  patch '/figures/:id' do
          @figure = Figure.find(params[:id])
          @figure.update(params[:figure])
          unless params[:landmark][:name].empty? && params[:landmark][:year_completed].empty?
            new_landmark = Landmark.create(params[:landmark])
            new_landmark.update(figure_id: new_figure.id)
          end
          unless params[:title][:name].empty?
            new_title = Title.create(params[:title])
            FigureTitle.create(figure_id: new_figure.id, title_id: new_title.id)
          end
          redirect "/figures/#{@figure.id}"
  end

  delete '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.delete
  redirect "/recipes"
  end


  #Delete
end
