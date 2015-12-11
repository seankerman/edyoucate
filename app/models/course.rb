class Course < ActiveRecord::Base
  belongs_to :teacher, :class_name => "User"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :sorted, lambda { order("courses.name ASC")}

end
