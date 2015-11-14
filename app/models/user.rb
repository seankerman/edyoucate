class User < ActiveRecord::Base

	scope :sorted, lambda { order('users.name ASC') }
  	
  	validates :name, :presence => true,
  						 :length => { :maximum => 50 }
end
