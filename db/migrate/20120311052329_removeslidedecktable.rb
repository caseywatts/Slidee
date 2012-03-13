class Removeslidedecktable < ActiveRecord::Migration
  def change
    drop_table :slidedecks
  end

end
