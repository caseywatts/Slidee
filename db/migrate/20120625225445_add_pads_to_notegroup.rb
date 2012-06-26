class AddPadsToNotegroup < ActiveRecord::Migration
  def change
    add_column :notegroups, :pads, :text
  end
end
