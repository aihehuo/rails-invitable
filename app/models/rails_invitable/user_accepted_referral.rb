module RailsInvitable
  class UserAcceptedReferral < ApplicationRecord
    belongs_to :user, class_name: RailsInvitable.user_class.to_s, required: false
    belongs_to :referral, required: true

    validates :phone, presence: true, format: { with: /\d{11}/ }, length: { is: 11 }, uniqueness: true
    validates :user_id, uniqueness: true, allow_nil: true

    def title
      I18n.t('rails_invitable.titles.user_accepted_referral', name: user.name)
    end
  end
end
