class Concert < ApplicationRecord
  has_many :tickets
  has_many :users,through: :tickets
 



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

  def next_id
    next_concert = self.class.where("id >?", id).first
    if next_concert
       next_concert.id
    else
      Concert.first.id
    end
  end

end
