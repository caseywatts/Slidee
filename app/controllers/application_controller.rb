class ApplicationController < ActionController::Base
  protect_from_forgery
  #include Magick
  before_filter RubyCAS::Filter, :unless => :skip_login? 
  #before_filter :login_check #, :except => :access_denied
  before_filter :current_user
  before_filter :set_current_user
  helper_method :current_user
  #helper_method :logout_user



  protected
  def current_user
    @current_user ||= (
    if session[:cas_user]
      if User.find_by_login(session[:cas_user])
        User.find_by_login(session[:cas_user])
      else
        redirect_to :controller=>'users', :action => 'new'
        #User.create(:login => session[:cas_user])
      end
    else
      nil
    end)
  end

  #def logout_user
    #RubyCAS::Filter.logout(self)
  #end
  def set_current_user
    User.current = current_user
  end

private
def skip_login?
    false
end


end
