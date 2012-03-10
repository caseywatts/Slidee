class Presentation < ActiveRecord::Base
  belongs_to :course
  has_many :slides
  require 'RMagick'
  include Magick

  #validates_presence_of :course_id
  attr_accessor :course_id

  def create_slides
    #TODO @presentation.slidedeck ---this ought to work but doesn't yet - I must've messed up relationships?
    #@presentation
    #slides = ImageList.new(Slidedeck.last.deck.url)
    slides = ImageList.new("app/assets/ST_Training_-_Week_7.pdf") #TODO write these images to ~jpg
    slides.each { |slide|
      Slide.create(:presentation => self, :image => slide)
    }
  end
end
