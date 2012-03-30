class Notegroup < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :presentation
  attr_accessor :users_to_add
end
