class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response = conn.get("/3/movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end

  def show
    @user = User.find(params[:user_id])
    # @movie = User.find(params[:movie_id])
    
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response = conn.get("/3/movie/#{params[:movie_id]}")
    json = JSON.parse(response.body, symbolize_names: true)

    @movie = json
    
  end
end