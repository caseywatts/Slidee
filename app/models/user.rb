class User < ActiveRecord::Base
  has_many :presentations
  has_and_belongs_to_many :notegroups
  #named_scope :all_presentations, lambda {
    #{
      #:include => :presentations,
      #:conditions => [ "d IN (?)", Presentations.map(&:id) ]
    #}
  #}
end
