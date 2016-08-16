class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
  	net_happiness = happiness - nausea if happiness && nausea
  	return net_happiness > 0 ? 'happy' : 'sad' if net_happiness
  	'no mood' unless net_happiness
  end
end
