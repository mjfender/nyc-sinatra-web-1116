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
    binding.pry

    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end
end
