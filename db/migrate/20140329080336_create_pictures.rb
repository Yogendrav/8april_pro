class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :project_id
      t.string :attachment

      t.timestamps
    end
  end
end
