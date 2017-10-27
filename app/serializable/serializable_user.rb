class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attribute :name

end
