module RailsInvitable
  class RedPocketRecordSerializer < ActiveModel::Serializer
    include TimeHelper

    attributes :id
    attributes :referable_title
    attributes :amount
    attributes :incoming
    attributes :created_at_formated

    belongs_to :user

    def created_at_formated
      format_to_datetime(object.created_at)
    end
  end
end
