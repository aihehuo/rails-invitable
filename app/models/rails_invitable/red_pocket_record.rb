module RailsInvitable
  class RedPocketRecord < ApplicationRecord
    belongs_to :referable, polymorphic: true
    belongs_to :user, class_name: RailsInvitable.user_class.to_s

    validates :referable_id, :referable_type, presence: true
    validates :referable_id, uniqueness: { scope: :referable_type }
    validates :amount, numericality: { greater_than: 0 }

    def referable_title
      referable.title
    end
  end
end
