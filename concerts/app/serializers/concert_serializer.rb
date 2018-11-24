class ConcertSerializer < ActiveModel::Serializer
  attributes :id, :title, :min_age, :cost, :time
  belongs_to :users
end
