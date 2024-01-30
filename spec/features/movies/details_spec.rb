require "rails_helper"

RSpec.describe "Movies Details Page", type: :feature do
  describe "When I visit a movie's detail page" do
    before(:each) do
      @user1 = User.create!(name: "Taylor Swift", email: "taylorswift@gmail.com")
      @user2 = User.create!(name: "Travis Kelce", email: "traviskelce@gmail.com")
    end
    # As a user, 
    # When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`) where :id is a valid user id,
    # I should see
    # - a button to Create a Viewing Party
    # - a button to return to the Discover Page

    # I should also see the following information about the movie:

    # - Movie Title
    # - Vote Average of the movie
    # - Runtime in hours & minutes
    # - Genre(s) associated to movie
    # - Summary description
    # - List the first 10 cast members (characters & actress/actors)
    # - Count of total reviews
    # - Each review's author and information
    it "Should see a button to 'Create a Viewing Party'" do
      visit "/users/#{@user1.id}/movies/238"

      expect(page).to have_button("Create a Viewing Party")

      click_button("Create a Viewing Party")

      expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing_party/new")
    end
  end
end