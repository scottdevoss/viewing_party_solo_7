require "rails_helper"

RSpec.describe Review do 
  it "exists" do
    details = {
      author: "Taylor Swift",
      author_details: {
        name: "Taylor Swift",
        username: "tay_swift",
        rating: 10.0
      }
    }

    reviewer = Review.new(details)
    
    expect(reviewer).to be_a Review
    expect(reviewer.author).to eq "Taylor Swift"
    expect(reviewer.username).to eq "tay_swift"
    expect(reviewer.rating).to eq 10.0
  end
end