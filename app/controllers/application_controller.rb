class ApplicationController < ActionController::Base
  protect_from_forgery
  #include Magick
  before_filter RubyCAS::Filter


end
