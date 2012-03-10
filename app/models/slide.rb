class Slide < ActiveRecord::Base
  belongs_to :presentation

  #validates_presence_of :presentation_id
  attr_accessor :image

end
