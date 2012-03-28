class User < ActiveRecord::Base
  has_many :presentations
  has_and_belongs_to_many :notegroups
end
