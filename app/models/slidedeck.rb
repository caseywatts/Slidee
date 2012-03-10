class Slidedeck < ActiveRecord::Base
  belongs_to :presentation
  has_attached_file :deck
end
