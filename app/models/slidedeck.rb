class Slidedeck < ActiveRecord::Base
  belongs_to :presentation
  has_attached_file :deck, :styles => { :large => "600x600>", :thumb => "100x100>" }
end
