class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_created_by
      t.integer :project_created_on
      t.text :project_details
      t.datetime :project_starts_on
      t.datetime :project_ends_on
      t.string :status
      t.string :invite_people
      t.integer :user_id
      t.timestamps
    end
  end
end
