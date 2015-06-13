class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many 	 :clipped_files, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name, message: "уже есть"
  validates_length_of :name, :within => 4..20, :too_long => "слишком длинный", :too_short => "слишком короткий"
end
