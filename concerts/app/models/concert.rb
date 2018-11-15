class Concert < ApplicationRecord
  has_many :tickets
  has_many :users,through: :tickets
  accepts_nested_attributes_for :tickets

  


def age_req
  if min_age >= 21
    "Adults Only"
  elsif min_age <= 20
    "All ages"
  end
end

def showtime
  time.strftime('%m/%d/%Y at %I:%M %p')
end

def self.agereqscope(age)
  where("min_age <=  ?", age)
end

end
