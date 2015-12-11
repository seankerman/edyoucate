class User < ActiveRecord::Base
	has_many :courses #this is the courses they teach

	has_secure_password
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#"}
	enum role: [:user, :teacher, :admin]

	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :user
	end

	scope :sorted, lambda { order('users.username ASC') }

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  	

  	validates :first_name, :presence => true,
  						 :length => { :maximum => 25 }
	validates :last_name, :presence => true,
							:length => { :maximum => 50 }
	#validates :image, :attachment_presence => true
	validates_attachment :image, :size => { :in => 0..10000.kilobytes}
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates :username, :presence => true,
						   :length => { :within => 5..25 },
						   :uniqueness => true
	validates :email, :presence => true,
						:length => { :maximum => 100 },
						:format => EMAIL_REGEX,
						:confirmation => true
	validates :role, :presence => true

	#validate :user_name_is_allowed
end
