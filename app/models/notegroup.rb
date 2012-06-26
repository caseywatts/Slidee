class Notegroup < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :presentation
  serialize :pads, Array
  attr_accessible :pads

  attr_accessor :users_to_add #this allows us to add multiple users at once - the controller loops through them

  def everyonebutme
    userlist = self.users - [User.current]
  end

  def create_pads
    unless self.pads.nil? #this should only be run once ever

      @ether ||= EtherpadLite.connect('http://slideeetherpad.cloudfoundry.com', 'HwcKLaD2oyADLbX6ZO8ZgA719Du9NA17')
      self.pads = []

      self.presentation.slides.each_with_index do |slide, i|
        padid = "notegroup#{self.id}slide#{slide.id}"
        pad = @ether.pad(padid)
        pad.text = slide.slidetext
        self.pads << padid
      end

      self.save

    end
  end

end
