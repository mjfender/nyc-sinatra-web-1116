class LandmarksController < ApplicationController
  
  get '/landmarks' do
    # binding.pry
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # @figure = Figure.create(params[:figure])
    
    # if !params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:title])
    #   @figure.save
    # end

    # if !params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    #   @figure.save
    # end
    
    # redirect '/figures'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    
    redirect "/landmarks/#{@landmark.id}"
  end

end

