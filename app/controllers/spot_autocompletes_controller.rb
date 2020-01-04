class SpotAutocompletesController < ApplicationController
  skip_after_action :verify_authorized, only: [:autocomplete, :place_details]
  # 2 POST requests (autocomplete and place_details) to rails server to
  # execute google API call and return results to frontend

  def autocomplete
    keyword = params[:keyword]
    gs = Api::Google.new
    results = gs.autocomplete(keyword)
    render json: results # return to frontend (-> results injected by spot_autocomplete_dropdown.js)
  end

  def place_details
    place_id = params[:placeid]
    gs = Api::Google.new
    place_details = gs.place_details(place_id, ["name","formatted_address","formatted_phone_number","website"])
    return nil if place_details.nil?
    render json: place_details # return to frontend (-> results injected by spot_autocomplete_dropdown.js)
  end
end
