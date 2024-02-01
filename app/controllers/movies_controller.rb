class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new
    @user = User.find(params[:user_id])
  end
  
  def show
    @user = User.find(params[:user_id])
    @movie = MovieDetailsFacade.new(params[:movie_id])
    @cast = CastFacade.new(params[:movie_id])
    @reviews = ReviewFacade.new(params[:movie_id])
  end
end