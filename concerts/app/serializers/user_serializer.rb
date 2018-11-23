class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :money, :password_confirmation
  belongs_to :concert
end
