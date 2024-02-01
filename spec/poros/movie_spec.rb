require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {
      id: 238,
      title: "The Godfather",
      vote_average: 8.77
    }

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq 238
    expect(movie.title).to eq "The Godfather"
    expect(movie.vote_average).to eq 8.77
  end
end