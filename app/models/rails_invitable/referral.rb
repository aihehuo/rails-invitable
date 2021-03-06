module RailsInvitable
  class Referral < ApplicationRecord
    belongs_to :user, class_name: RailsInvitable.user_class.to_s, required: true
    has_many :user_accepted_referrals

    validates :code, presence: true, uniqueness: true
  end
end
