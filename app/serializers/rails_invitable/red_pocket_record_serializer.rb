module RailsInvitable
  class RedPocketRecordSerializer < ActiveModel::Serializer
    attributes :id
    attributes :referable_title
    attributes :amount
    attributes :incoming
    attributes :created_at

    belongs_to :user
  end
end
