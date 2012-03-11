class ApplicationController < ActionController::Base
  protect_from_forgery
  #include Magick
  before_filter RubyCAS::Filter
  #before_filter :login_check #, :except => :access_denied


  protected
  def current_user
    @current_user ||= (
    if @user_session #we don't use this, but I just didn't take it out~
      @user_session.user
    elsif session[:cas_user]
      User.find_by_login(session[:cas_user])
    else
      nil
    end)
  end
end
