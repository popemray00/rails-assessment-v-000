class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :min_age, :cost, :time
  has_many :users
end
