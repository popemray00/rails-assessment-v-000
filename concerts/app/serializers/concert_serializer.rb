class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :min_age, :cost, :time, :next_id, :users
  has_many :users
end
