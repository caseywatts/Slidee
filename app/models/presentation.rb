class Presentation < ActiveRecord::Base
  belongs_to :course
  has_many :slides
  require 'RMagick'
  include Magick

  #validates_presence_of :course_id
  attr_accessor :course_id

  def create_slides
    require 'RMagick'
    #include Magick #how do I call this?
    #@presentation.slidedeck ---this ought to work but doesn't yet - I must've messed up relationships?
    #@presentation
    #slides = ImageList.new(Slidedeck.last.deck.url)
    slides = ImageList.new("app/assets/ST_Training_-_Week_7.pdf")
    slides.each { |slide|
      Slide.create(:presentation => Presentation.last)
    }
  end
end
