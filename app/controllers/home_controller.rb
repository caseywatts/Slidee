class HomeController < ApplicationController

  def index
    if current_user
      #redirect_to :controller => "presentations", :action => "index"
    else
    #require 'etherpad-lite'

    ## Connect to your Etherpad Lite instance
    #ether = EtherpadLite.connect(:local, '8JELX2nMKQOIWbr1W7gN7EZyWlFaoQrq')

    ## Get a Pad (or create one if it doesn't exist)
    #@pad = ether.pad('test')
    ##@pad.text = "This is what my locally hosted pad's text contents are. That other pad is hosted on beta.etherpad.net"
    end
  end

  #def current_user
    #@current_user ||= (
    #if session[:cas_user]
      #if User.find_by_login(session[:cas_user])
        #User.find_by_login(session[:cas_user])
      #else
        ##redirect_to :controller=>'users', :action => 'new'
        ##User.create(:login => session[:cas_user])
      #end
    #else
      #nil
    #end)
  #end

private
def skip_login?
    true
end

end
