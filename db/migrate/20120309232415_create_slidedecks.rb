class CreateSlidedecks < ActiveRecord::Migration
  def change
    create_table :slidedecks do |t|

      t.references :presentation
      t.timestamps
    end
  end
end
