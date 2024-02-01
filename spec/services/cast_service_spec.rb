require "rails_helper"

describe CastService do
  context "class methods" do
    context "#cast_members" do
      it "returns cast members", :vcr do
        cast = CastService.new.cast_members(238)
        
        expect(cast).to be_a Hash
        expect(cast).to have_key :id
        expect(cast[:id]).to be_a Integer

        expect(cast).to have_key :cast
        expect(cast[:cast]).to be_a Array
        
        cast[:cast].each do |member|
          expect(member).to have_key :name
          expect(member[:name]).to be_a String

          expect(member).to have_key :character
          expect(member[:character]).to be_a String
        end
      end
    end
  end
end