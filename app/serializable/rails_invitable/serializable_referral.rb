module RailsInvitable
  class SerializableReferral < JSONAPI::Serializable::Resource
    type 'referrals'

    attribute :code
    attribute :created_at
    attribute :updated_at

    # has_one :user
    # has_many :user_accepted_referrals
  end
end
