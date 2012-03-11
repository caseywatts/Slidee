class AddAttachmentDeckToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :deck_file_name, :string
    add_column :presentations, :deck_content_type, :string
    add_column :presentations, :deck_file_size, :integer
    add_column :presentations, :deck_updated_at, :datetime
  end

  def self.down
    remove_column :presentations, :deck_file_name
    remove_column :presentations, :deck_content_type
    remove_column :presentations, :deck_file_size
    remove_column :presentations, :deck_updated_at
  end

  #drop_table :slidedecks
  #drop_table :slideimages
end
