class MovieDetails
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview
  def initialize(details)
    @id = details[:id]
    @title = details[:title]
    @vote_average = details[:vote_average]
    @runtime = details[:runtime]
    @genres = details[:genres]
    @overview = details[:overview]
  end
end