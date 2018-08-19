require 'open-uri'
class Place < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :own_places_count

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  has_many   :followers,
             :through => :owner,
             :source => :following

  # Validations

end
