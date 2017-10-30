module RailsInvitable
  class Withdraw < ApplicationRecord
    serialize :transfer, JSON
    serialize :response, JSON
    
    belongs_to :user, class_name: RailsInvitable.user_class.to_s, optional: true
  end
end
