class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new
    @user = User.find(params[:user_id])
  end
  
  def show
    
    @user = User.find(params[:user_id])
    @movie = MovieDetailsFacade.new(params[:movie_id])
    @cast = CastFacade.new(params[:movie_id])
    
   


    # conn2 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response2 = conn2.get("/3/movie/#{params[:movie_id]}/credits")
    # json2 = JSON.parse(response2.body, symbolize_names: true)
    # # @cast = json2[:cast]
    # @cast = json2[:cast].map do |cast_member|
    #   Cast.new(cast_member)
    # end



    conn3 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response3 = conn3.get("/3/movie/#{params[:movie_id]}/reviews")
    json3 = JSON.parse(response3.body, symbolize_names: true)
    @reviews = json3[:results]
  end
end