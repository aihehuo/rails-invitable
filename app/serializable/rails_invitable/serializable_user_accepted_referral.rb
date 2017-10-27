module RailsInvitable
  class SerializableUserAcceptedReferral < JSONAPI::Serializable::Resource
    type 'user_accepted_referrals'

    attribute :created_at
    attribute :registered_at
    attribute :completed_at
    attribute :phone

    belongs_to :user
    belongs_to :referral
  end
end
