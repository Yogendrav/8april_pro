class AddColumnToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :resource_id, :integer
    add_column :pictures, :resource_type, :string
  end
end
