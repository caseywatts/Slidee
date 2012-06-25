class Slide < ActiveRecord::Base
  belongs_to :presentation
  #validates :slidetext

  has_attached_file :image, :styles => {},
    :storage => :s3,
    :s3_credentials => "config/s3_credentials.yaml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'Slidee',
    :default_url => '/images/missing_:style.jpg'


end
