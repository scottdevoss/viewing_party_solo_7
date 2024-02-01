class MovieDetailsFacade
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def movie_details
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response = conn.get("/3/movie/#{id}")
    # json = JSON.parse(response.body, symbolize_names: true)

    service = MovieDetailsService.new

    json = service.get_movie_details(@id)
    # @movie = json
    @movie_details = MovieDetails.new(json)
  end
end