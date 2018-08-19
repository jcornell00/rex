class FollowRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => :received_follow_requests_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_follow_requests_count

  # Indirect associations

  # Validations

end
