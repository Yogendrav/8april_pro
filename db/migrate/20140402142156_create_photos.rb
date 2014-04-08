class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :document
      t.integer :image_id
      t.string :image_type

      t.timestamps
    end
  end
end
