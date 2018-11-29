class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :money
  has_many :concerts
  has_many :notes
end
