class AddTextToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :slidetext, :text
  end
end
