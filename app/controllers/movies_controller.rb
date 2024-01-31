class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new
    @user = User.find(params[:user_id])
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response = conn.get("/3/movie/top_rated")
    # json = JSON.parse(response.body, symbolize_names: true)
    # # @movies = json[:results]
    # @movies = json[:results].map do |movie_data|
    #   Movie.new(movie_data)
    # end
  end

  def show
    @user = User.find(params[:user_id])
    # @movie = User.find(params[:movie_id])
    
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response = conn.get("/3/movie/#{params[:movie_id]}")
    json = JSON.parse(response.body, symbolize_names: true)
    # @movie = json
    @movie = MovieDetails.new(json)




    conn2 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response2 = conn2.get("/3/movie/#{params[:movie_id]}/credits")
    json2 = JSON.parse(response2.body, symbolize_names: true)
    @cast = json2[:cast]

    conn3 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response3 = conn3.get("/3/movie/#{params[:movie_id]}/reviews")
    json3 = JSON.parse(response3.body, symbolize_names: true)
    @reviews = json3[:results]
  end
end