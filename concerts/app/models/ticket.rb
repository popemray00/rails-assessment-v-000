class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :concert


  def purchaseticket
    if (user.age >= concert.min_age) && (user.money >= concert.cost) && (!user.concerts.find {|c| c.showtime == concert.showtime})
      user.money = user.money - concert.cost
      user.save(validate: false)
      self.save
      "Success"
    elsif (user.age < concert.min_age)
       "Sorry, you don't meet the minimum age to attend this show!"
    elsif (user.money < concert.cost)
       "Sorry, you don't have enough money to make this purchase"
     elsif user.concerts.find {|c| c.showtime == concert.showtime}
       "You already have a ticket for this concert."
    end
  end

  def self.top
      group(:concert_id).order('count(*) DESC').limit(1).pluck(:concert_id)[0]
  end
end
