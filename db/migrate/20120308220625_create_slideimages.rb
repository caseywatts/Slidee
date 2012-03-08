class CreateSlideimages < ActiveRecord::Migration
  def change
    create_table :slideimages do |t|

      t.timestamps
    end
  end
end
