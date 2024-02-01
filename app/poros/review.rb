class Review
  attr_reader :author, :username, :rating
  def initialize(review_info)
    @author = review_info[:author]
    @username = review_info[:author_details][:username]
    @rating = review_info[:author_details][:rating]
  end
end