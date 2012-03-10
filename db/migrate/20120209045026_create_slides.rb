class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :number
      t.string :title
      t.text :content
      t.references :presentation

      t.timestamps
    end
  end
end
