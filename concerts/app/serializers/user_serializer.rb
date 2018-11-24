class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :money
  has_many :concerts
end
