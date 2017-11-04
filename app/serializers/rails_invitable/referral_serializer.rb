module RailsInvitable
  class ReferralSerializer < ActiveModel::Serializer
    attributes :id
    attributes :code

    belongs_to :user
    has_many :user_accepted_referrals
  end
end
