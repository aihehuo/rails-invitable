module RailsInvitable
  class UserAcceptedReferralSerializer < ActiveModel::Serializer
    attributes :id
    attributes :created_at
    attributes :registered_at
    attributes :completed_at
    attributes :phone

    belongs_to :user
    belongs_to :referral
  end
end
