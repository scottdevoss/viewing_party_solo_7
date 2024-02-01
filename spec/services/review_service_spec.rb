require "rails_helper"

describe ReviewService do
  context "class methods" do
    context "#review_info(id)" do
      it "returns review details", :vcr do
        reviews = ReviewService.new.review_info(238)
        
        expect(reviews).to be_a Hash
        expect(reviews).to have_key :id
        expect(reviews[:id]).to be_a Integer

        review_details = reviews[:results].each do |review|
          expect(review[:author]).to be_a String
          expect(review[:author_details][:name]).to be_a String
          expect(review[:author_details][:username]).to be_a String
          expect(review[:author_details][:rating]).to be_a Float
        end
      end
    end
  end
end