class Course < ActiveRecord::Base
  belongs_to :user
  has_many   :lectures, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name, message: "уже есть"
  validates_length_of :name, :within => 4..20, :too_long => "слишком длинный", :too_short => "слишком короткий"
end
