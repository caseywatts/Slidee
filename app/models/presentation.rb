class Presentation < ActiveRecord::Base
  require 'RMagick'
  include Magick

  belongs_to :course
  has_one :slidedeck

  has_many :slides, :dependent => :destroy
  has_many :users
  has_many :notegroups
  #has_attached_file :deck #we'll have to convert some deckoriginals to pdf first, we'll use this later
  has_attached_file :deckoriginal,
                    :styles => {
                      :pdf => {
                        :format => "pdf",
                        :processors => [:docsplit_pdf]
                      }
                    }
  #validates_attachment_content_type :deckoriginal, :content_type => ['application/pdf'], :if => deckoriginal_attached?
  #after_deckoriginal_post_process :create_slides
  #validates :deckoriginal, :attachment_presence => true
  validates_attachment_presence :deckoriginal
  #validates_attachment_content_type :deckoriginal, :content_type => ['application/pdf'], :message => "must be PDF."






  def create_pads(user)

  end

  def join_pads(user)

  end

  def create_slides
    #TODO @presentation.slidedeck ---this ought to work but doesn't yet - I must've messed up relationships?
    pdflocation = Dir[self.deckoriginal.url(:pdf).gsub(/\?.*$/,"")] #strips off the trailing random digits (from paperclip)

    pdflocation = "app/assets/CHEM+230+9.14.2011.ppt"
    basename = File.basename(pdflocation, '.*')
    temporary_dir = Dir.tmpdir

    # Extract Text Into An Array
    Docsplit.extract_text(pdflocation, :output => temporary_dir)
    texts = File.open(File.join(temporary_dir, "#{basename}.txt")).read #we can predict how it'll be formatted~
    textarray = texts.split("\f") # \f is "flood page" or "clear everything from the page" = "newpage" in pdf speak

    # Extract Images Into An Array
    Docsplit.extract_images(pdflocation, :size => "1000x", :format => :jpg, :output => temporary_dir)

    binding.pry
    textarray.each_with_index do |text, i|
      Slide.create(:presentation => self, :image => File.open(File.join(temporary_dir, "#{basename}_#{i+1}.jpg")), :slidetext => text)
      binding.pry
    end
    #deck = ImageList.new('public' + self.deckoriginal.url(:pdf).gsub(/\?.*$/,""))

    #deck.each { |slide|
      #temporaryfile = Tempfile.new("my_picture")
      #slide.write("jpeg:" + temporaryfile.path) #writes the slideimage to a temporary file
      ##location = "app/assets/presentations/" + image.hash.to_s + ".jpg" 
      ##slide.write(location)
      #Slide.create(:presentation => self, :image => temporaryfile)
    #}
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
