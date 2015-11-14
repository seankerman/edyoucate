class Course < ActiveRecord::Base

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :sorted, lambda { order("courses.name ASC")}

end
