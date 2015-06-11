class User < ActiveRecord::Base
	validates_presence_of :name,  message: "не может быть пустым"
	validates_uniqueness_of :name, message: "уже есть"
	validates_length_of :name, :within => 4..10, :too_long => "слишком длинный", :too_short => "слишком короткий"
	has_secure_password
	# has_many :messages, dependent: :destroy			
end
