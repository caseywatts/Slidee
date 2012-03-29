class Presentation < ActiveRecord::Base
  require 'RMagick'
  include Magick

  belongs_to :course
  has_one :slidedeck

  has_many :slides, :dependent => :destroy
  has_many :users
  has_many :notegroups
  #has_attached_file :deck #we'll have to convert some deckoriginals to pdf first, we'll use this later
  has_attached_file :deckoriginal,  :content_type => 'application/pdf'
  #validates_attachment_content_type :deckoriginal, :content_type => ['application/pdf'], :if => deckoriginal_attached?
  #after_deckoriginal_post_process :create_slides
  #validates :deckoriginal, :attachment_presence => true
  validates_attachment_presence :deckoriginal
  validates_attachment_content_type :deckoriginal, :content_type => ['application/pdf']






  def create_pads(user)

  end

  def join_pads(user)

  end

  def create_slides
    #TODO @presentation.slidedeck ---this ought to work but doesn't yet - I must've messed up relationships?
    #@presentation
    #slides = ImageList.new(Slidedeck.last.deck.url)
    deck = ImageList.new('public' + self.deckoriginal.url.gsub(/\?.*$/,""))
    #deck = ImageList.new('app/assets/TrainingSample.pdf')
    deck.each { |slide|
      temporaryfile = Tempfile.new("my_picture")
      slide.write("jpeg:" + temporaryfile.path) #writes the slideimage to a temporary file
      #location = "app/assets/presentations/" + image.hash.to_s + ".jpg" 
      #slide.write(location)
      Slide.create(:presentation => self, :image => temporaryfile)
    }
  end
  private

#pages => slides
  #:asset => :deckoriginal

  #def make_pages
    #if valid?
      #Paperclip.run('convert', "-quality #{Page::QUALITY} -density #{Page::DENSITY} #{deckoriginal.queued_for_write[:original].path} #{deckoriginal.queued_for_write[:original].path}%d.png")
      #images = Dir.glob("#{deckoriginal.queued_for_write[:original].path}*.png").sort_by do |line|
        #line.match(/(\d+)\.png$/)[1].to_i
      #end

      #images.each do |page_image|
        #slides.build(:deckoriginal => File.open(page_image))
      #end
      #FileUtils.rm images
    #end
  #end


end
