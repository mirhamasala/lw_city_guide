require "application_system_test_case"

class CitiesTest < ApplicationSystemTestCase
  test "visiting the homepage" do
    visit "/"
    assert_selector "h1", text: "Find your favorite hot spots in Le Wagon's cities"
    assert_selector ".main-card__title", count: City.count
  end
end
