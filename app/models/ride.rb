class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
  	if !enough_tickets && tall_enough
  		"Sorry. You do not have enough tickets the #{attraction.name}."
  	elsif enough_tickets && !tall_enough
  		"Sorry. You are not tall enough to ride the #{attraction.name}."
  	elsif !enough_tickets && !tall_enough
  		"Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  	else
  		update_tickets
  		update_nausea
  		update_happiness
  	end
  end

  private

  	def enough_tickets
  		user.tickets >= attraction.tickets
  	end

  	def tall_enough
  		user.height >= attraction.min_height
  	end

  	def update_tickets
  		new_tickets = user.tickets.to_i - attraction.tickets.to_i
  		user.update(tickets: new_tickets)
  	end

  	def update_nausea
  		new_nausea = user.nausea.to_i + attraction.nausea_rating.to_i
  		user.update(nausea: new_nausea)
  	end

  	def update_happiness
  		new_happiness = user.happiness.to_i + attraction.happiness_rating.to_i
  		user.update(happiness: new_happiness)
  	end
end
