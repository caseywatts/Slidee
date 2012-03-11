class HomeController < ApplicationController

  def index
    require 'etherpad-lite'

    # Connect to your Etherpad Lite instance
    ether = EtherpadLite.connect(:local, '8JELX2nMKQOIWbr1W7gN7EZyWlFaoQrq')

    # Get a Pad (or create one if it doesn't exist)
    @pad = ether.pad('test')
    #@pad.text = "This is what my locally hosted pad's text contents are. That other pad is hosted on beta.etherpad.net"



  end

end
