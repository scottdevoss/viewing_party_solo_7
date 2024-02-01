class MovieDetailsFacade
  attr_reader :id
  def initialize(id)
    @id = id
  end

  def movie_details
    service = MovieDetailsService.new

    json = service.get_movie_details(@id)
    
    @movie_details = MovieDetails.new(json)
  end
end