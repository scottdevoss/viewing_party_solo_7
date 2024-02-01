class ReviewFacade
  def initialize(id)
    @id = id
  end

  def review
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response = conn.get("/3/movie/#{@id}/reviews")
    # json = JSON.parse(response.body, symbolize_names: true)

    service = ReviewService.new

    json = service.review_info(@id)
    
    @reviews = json[:results].map do |review|
      Review.new(review)
    end
  end
end