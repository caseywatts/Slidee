class AddAttachmentDeckToSlidedeck < ActiveRecord::Migration
  def self.up
    add_column :slidedecks, :deck_file_name, :string
    add_column :slidedecks, :deck_content_type, :string
    add_column :slidedecks, :deck_file_size, :integer
    add_column :slidedecks, :deck_updated_at, :datetime
  end

  def self.down
    remove_column :slidedecks, :deck_file_name
    remove_column :slidedecks, :deck_content_type
    remove_column :slidedecks, :deck_file_size
    remove_column :slidedecks, :deck_updated_at
  end
end
