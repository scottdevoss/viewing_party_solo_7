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
    it "Should see a button to 'Create a Viewing Party'", :vcr do
      visit "/users/#{@user1.id}/movies/238"

      expect(page).to have_button("Create a Viewing Party")

      click_button("Create a Viewing Party")

      expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing_party/new")
    end

    it "Should see a button to return to the Discover Page", :vcr do
      visit "/users/#{@user1.id}/movies/238"

      expect(page).to have_button("Return To Discover Page")

      click_button "Return To Discover Page"

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it "Should see movie title, vote average, runtime, genres, summary, list of 10 cast members, count of total reviews, each review's author and information", :vcr do
      visit "/users/#{@user1.id}/movies/238"

      expect(page).to have_content("Movie Title: The Godfather")
      expect(page).to have_content("Vote Average: 8.707")
      expect(page).to have_content("Runtime: 2 hours 55 minutes")
      expect(page).to have_content("Genre: Drama, Crime")
      expect(page).to have_content("Summary:")
      expect(page).to have_content("First 10 Cast Members:")
      expect(page).to have_content("Total Reviews:")
      expect(page).to have_content("Reach Review's Author and Information:")
    end
  end
end