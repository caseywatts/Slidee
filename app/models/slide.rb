class Slide < ActiveRecord::Base
  belongs_to :presentation
  #validates_presence_of :presentation_id
  #attr_accessor :image

  has_attached_file :image, :styles => { :large => "600x600>", :thumb => "100x100>" }

end
