class MovieFacade
  # def initialize(search)
  #   @search = search
  # end

  def movies
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response = conn.get("/3/movie/top_rated")
    # json = JSON.parse(response.body, symbolize_names: true)
    
    service = MovieService.new

    json = service.top_rated_movies

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end