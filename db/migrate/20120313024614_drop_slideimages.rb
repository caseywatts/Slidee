class DropSlideimages < ActiveRecord::Migration
  def change
    drop_table :slideimages
  end

end
