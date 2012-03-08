class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|

      t.integer :course_id
      t.timestamps
    end
  end
end
