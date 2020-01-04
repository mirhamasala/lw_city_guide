module Api
  class Google
    def initialize
      @api_key = ENV['GOOGLE_PLACES_SERVER_API_KEY']
      @session_token = session_token
    end

    def place_details(place_id, fields = ALL_PLACE_DETAILS_FIELDS)
      reset_session_token
      fields_concat = "&fields=#{fields.join(",")}"
      base_url = "https://maps.googleapis.com/maps/api/place/details/json?"
      params = "key=#{@api_key}&placeid=#{place_id}&sessiontoken=#{@session_token}"
      url = base_url + params + fields_concat
      results = JSON.parse(open(url).read)
      return results["result"]
    rescue
      return nil
    end

    # converts photo_reference to url
    # https://developers.google.com/places/web-service/photos
    def photo_reference(photo_reference)
      max_width = 400
      base_url = "https://maps.googleapis.com/maps/api/place/photo?"
      params = "key=#{@api_key}&photoreference=#{photo_reference}&maxwidth=#{max_width}"
      url = base_url + params
      response = RestClient.get(url)
      return response.request.url
    rescue
      return nil
    end

    # searches for a keyword
    # - returns predictions array by google
    # - or nil if no predictions made
    def autocomplete(keyword)
      base_url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?"
      params = "input=#{url_safe(keyword)}&key=#{@api_key}&sessiontoken=#{@session_token}"
      url = base_url + params
      results = JSON.parse(open(url).read)
      if results["predictions"].empty?
        return nil
      else
        return results["predictions"]
      end
    end

    # see documentation https://developers.google.com/places/web-service/details#fields
    ALL_PLACE_DETAILS_FIELDS = [
      "address_components",
      "adr_address",
      "formatted_address",
      "formatted_phone_number",
      "geometry",
      "icon",
      "international_phone_number",
      "name",
      "opening_hours",
      "photos/photo_reference",
      "place_id",
      "plus_code",
      "price_level",
      "rating",
      "types",
      "url",
      "website",
      "user_ratings_total",
      "vicinity",
      "permanently_closed",
    ]

    private

    # session tokens are needed for autocomplete calls, otherwise we pay for each single request!
    # just add them by default to all requests (doesn't hurt)
    def session_token
      SecureRandom.uuid # => generate UUID in this format: "96b0a57c-d9ae-453f-b56f-3b154eb10cda"
    end
    def reset_session_token
      @session_token = session_token # reinitialize session token
    end

    # escape url (string) to make it safe (only strip at the moment)
    def url_safe(str)
      # str.strip.gsub(/\s/, "%20")
      URI.encode(str.strip)
    end
  end
end


