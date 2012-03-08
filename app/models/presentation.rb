class Presentation < ActiveRecord::Base
  belongs_to :course
  has_many :slides

  #validates_presence_of :course_id
  attr_accessor :course_id


end
