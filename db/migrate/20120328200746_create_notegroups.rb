class CreateNotegroups < ActiveRecord::Migration
  def change
    create_table :notegroups do |t|
      t.references :presentation
      t.timestamps
    end
    create_table :notegroups_users, :id => false do |t|
      t.references :notegroup
      t.references :user
    end
  end
end
