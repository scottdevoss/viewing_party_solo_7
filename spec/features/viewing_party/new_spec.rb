require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feature do
  describe "When I visit the new viewing party page" do

    before(:each) do
      @user1 = User.create!(name: "Taylor Swift", email: "taylorswift@gmail.com")
      @user2 = User.create!(name: "Travis Kelce", email: "traviskelce@gmail.com")
      @user3 = User.create!(name: "Patrick Mahomes", email: "mahomes@gmail.com")
    end
    # When I visit the new viewing party page ('/users/:user_id/movies/:movie_id/viewing_party/new', where :user_id is a valid user's id and :movie_id is a valid Movie id from the API),
    # I should see the name of the movie title rendered above a form with the following fields:

    # - Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
    # - When: field to select date
    # - Start Time: field to select time
    # - Checkboxes next to each existing user in the system
    # - Button to create a party

    it "Should see the name of the movie title rendered above a form" do
      visit "/users/#{@user1.id}/movies/238/viewing_party/new"
      
      expect(page).to have_content("The Godfather")
    end

    it "Should see a form with fields: Duration of party, when, start time, checkboxes, button to create a party" do
      visit "/users/#{@user1.id}/movies/238/viewing_party/new"

      expect(page).to have_field(:duration)
      expect(page).to have_field(:when)
      expect(page).to have_field(:start_time)
      expect(page).to have_content("Invite Other Users")
      expect(page).to_not have_unchecked_field(@user1.name)
      expect(page).to have_unchecked_field(@user2.name)
      expect(page).to have_unchecked_field(@user3.name)
      expect(page).to have_button("Create Party")

      fill_in(:duration, with: '300')
      fill_in(:when, with: '2024-02-15')
      fill_in(:start_time, with: '12:00:00 UTC')

      click_button('Create A Party')

      expect(current_path).to eq("/users/#{@user1.id}")
      expect(page).to have_content('When: 2024-02-15')
      expect(page).to have_content('Start Time: 12:00:00 UTC')
    end
  end
end