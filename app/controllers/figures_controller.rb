class FiguresController < ApplicationController
  #view form to create figure
  # create figure with a title
  # create figure with a landmark
  # create figure with new title
  # create figure with new landmark
  # view all figures
  # see single figure
  # edit single figure


# view all figures
  get '/' do
    "OUR FUN LAB!!!!"
  end

  get '/figures' do
    # binding.pry

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
      @figure.save
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      @figure.save
    end
    
    redirect '/figures'
  end
  # => {"figure"=>{"name"=>"h", "title_ids"=>["1"], "landmark_ids"=>["3"]}, "title"=>{"name"=>"test"}, "landmark"=>{"name"=>"test2"}}


  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
      @figure.save
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      @figure.save
    end
    redirect "/figures/#{@figure.id}"
  end

end
