require 'test_helper'

class SpotAutocompletesControllerTest < ActionDispatch::IntegrationTest
  test "should get run" do
    get spot_autocompletes_run_url
    assert_response :success
  end

end
