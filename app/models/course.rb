class Course < ActiveRecord::Base
  has_many :presentations
end
