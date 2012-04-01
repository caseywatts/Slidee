class Slide < ActiveRecord::Base
  belongs_to :presentation
  #validates_presence_of :presentation_id
  #attr_accessor :image

  has_attached_file :image, :styles => { :large => "600x600>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3_credentials.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'Slidee',
    :default_url => '/images/missing_:style.jpg'


end
