require "open-uri"
class GroceryStore < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :ingredients,
             foreign_key: "store_id",
             dependent: :destroy

  # Indirect associations

  has_many   :meals,
             through: :ingredients,
             source: :meal

  has_many   :categories,
             through: :ingredients,
             source: :category

  # Validations

  # Scopes

  def to_s
    store_name
  end
end
