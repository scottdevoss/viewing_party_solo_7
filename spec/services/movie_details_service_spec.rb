require "rails_helper"

describe MovieDetailsService do
  context "class methods" do
    context "#get_movie_details" do
      it "returns movie details", :vcr do
        movie_details = MovieDetailsService.new.get_movie_details(238)
        
        expect(movie_details).to be_a Hash
        expect(movie_details).to have_key :id
        expect(movie_details[:id]).to be_a Integer

        expect(movie_details).to have_key :title
        expect(movie_details[:title]).to be_a String

        expect(movie_details).to have_key :vote_average
        expect(movie_details[:vote_average]).to be_a Float

        expect(movie_details).to have_key :runtime
        expect(movie_details[:runtime]).to be_a Integer

        expect(movie_details).to have_key :overview
        expect(movie_details[:overview]).to be_a String
      end
    end
  end
end