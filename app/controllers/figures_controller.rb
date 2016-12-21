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
    l_ids  = params[:figure][:landmark_ids]
    l_ids.each do |l|
      @figure.landmarks << Landmark.find_or_create_by(l.to_i)
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    # binding.pry


# binding.pry
    # @title = Title.create(params[:title])
    #
    # binding.pry
    #
    # @figure.titles << @title
    # @figure.save
    # @figure.titles = params[:figure][:title_ids]
  end
  # => {"figure"=>{"name"=>"h", "title_ids"=>["1"], "landmark_ids"=>["3"]}, "title"=>{"name"=>"test"}, "landmark"=>{"name"=>"test2"}}


  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end
end
