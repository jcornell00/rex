class Like < ApplicationRecord
  # Direct associations

  belongs_to :place,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
