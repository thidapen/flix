require 'spec_helper'
require 'rails_helper'

describe "Navigating movies" do
  it "allows navigation from the detail page to the listing page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie) # In show each url
    click_link "All Movies" # In this page have link "All Movies"
    expect(current_path).to eq(root_path) # expect current page that stay after click it will be go to back in root path to show all movie that have
  end
  it "show each link for detail page" do
  	 movie = Movie.create(movie_attributes)
  	 visit movies_url #
  	 click_link movie.title
  	 expect(current_path).to eq(movie_path(movie))
  end
end