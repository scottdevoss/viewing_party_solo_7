require "rails_helper"

RSpec.describe Cast do 
  it "exists" do
    details = {
      name: "Marlon Brando",
      character: "Don Vito Corleone"
    }

    cast = Cast.new(details)
  
    expect(cast).to be_a Cast
    expect(cast.name).to eq "Marlon Brando"
    expect(cast.character).to eq "Don Vito Corleone"
  end
end