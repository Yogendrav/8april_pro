class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :task_created_by
      t.string :all_project
      t.datetime :task_created_on
      t.text :task_details
      t.datetime :starts_on
      t.datetime :ends_on
      t.integer :project_id

      t.timestamps
    end
  end
end
