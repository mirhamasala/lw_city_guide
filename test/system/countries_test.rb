require "application_system_test_case"

class CountriesTest < ApplicationSystemTestCase
  test "lets an admin create a country" do
    login_as users(:mirha)
    visit "/countries/new/"

    fill_in "country_name", with: "Australia"

    click_on "Create Country"

    assert_equal root_path, page.current_path
    assert_text "Find your favorite hot spots in Le Wagon's cities"
  end

  test "prevent user from creating a country with an empty name" do
    login_as users(:mirha)
    visit "/countries/new"

    country_count_before = Country.count
    click_on "Create Country"

    assert_equal "/countries", page.current_path
    assert_equal country_count_before, Country.count
  end
end
