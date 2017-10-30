module RailsInvitable
  class RedPocketRecord < ApplicationRecord
    belongs_to :referable, polymorphic: true
    belongs_to :user, class_name: RailsInvitable.user_class.to_s
  end
end
