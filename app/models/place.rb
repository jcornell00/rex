class Place < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => :own_places_count

  # Indirect associations

  has_many   :followers,
             :through => :owner,
             :source => :following

  # Validations

end
