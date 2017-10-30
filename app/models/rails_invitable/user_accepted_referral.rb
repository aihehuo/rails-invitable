module RailsInvitable
  class UserAcceptedReferral < ApplicationRecord
    belongs_to :user, class_name: RailsInvitable.user_class.to_s, optional: true
    belongs_to :referral

    validates :phone, presence: true, format: { with: /\d{11}/ }, length: { is: 11 }, uniqueness: true
    validates :user_id, uniqueness: true
  end
end
