require "rails_helper"

RSpec.describe MovieDetails do 
  it "exists" do
    details = {
      id: 238,
      title: "The Godfather",
      vote_average: 8.77,
      runtime: 153,
      genres: "Drama",
      summary: "The Godfather..."
    }

    movie_details = MovieDetails.new(details)
    
    expect(movie_details).to be_a MovieDetails
    expect(movie_details.id).to eq 238
    expect(movie_details.title).to eq "The Godfather"
    expect(movie_details.vote_average).to eq 8.77
    expect(movie_details.runtime).to eq 153
    expect(movie_details.genres).to eq "Drama"
    # expect(movie_details.summary).to eq "The Godfather..."
  end
end