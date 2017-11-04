class UserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :thumb_avatar_url
end
