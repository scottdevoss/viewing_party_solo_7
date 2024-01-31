require "rails_helper"

describe MovieService do
  context "class methods" do
    context "#top_rated_movies" do
      it "returns top rated movies", :vcr do
        movies = MovieService.new.top_rated_movies
        
        expect(movies).to be_a Hash
        expect(movies[:results]).to be_an Array
        movie_data = movies[:results].first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a Integer

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a String

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a Float
      end
    end
  end
end