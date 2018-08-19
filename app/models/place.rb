class Place < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :own_places_count

  # Indirect associations

  # Validations

end
