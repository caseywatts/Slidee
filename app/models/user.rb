class User < ActiveRecord::Base
  has_many :presentations
  has_and_belongs_to_many :notegroups

  validates_uniqueness_of :login
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :email => true

  #named_scope :all_presentations, lambda {
    #{
      #:include => :presentations,
      #:conditions => [ "d IN (?)", Presentations.map(&:id) ]
    #}
  #}
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
  def fullname
    self.first_name + " " + self.last_name
  end
end
