class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :min_age, :cost, :time
  has_many :tickets
  has_many :users,through: :tickets
end
