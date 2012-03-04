class HomeController < ApplicationController
  def index
    require 'etherpad-lite'

# Connect to your Etherpad Lite instance
 ether = EtherpadLite.connect(:local, '8JELX2nMKQOIWbr1W7gN7EZyWlFaoQrq')

# Get a Pad (or create one if it doesn't exist)
@pad = ether.pad('my first etherpad lite pad')

@pad.text = "This is the entire contents of the first pad!"



  end

end
