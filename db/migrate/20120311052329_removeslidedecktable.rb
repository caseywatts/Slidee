class Removeslidedecktable < ActiveRecord::Migration
  def change
    drop_table :slidedecks
    #drop_table :slideimages
  end

end
