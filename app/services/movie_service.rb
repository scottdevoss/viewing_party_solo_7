class MovieService
  def top_rated_movies
    get_url("/3/movie/top_rated")
  end

  def get_url(url)
    response = conn.get("/3/movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end
end