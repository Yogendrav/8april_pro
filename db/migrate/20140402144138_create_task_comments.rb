class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.integer :task_id
      t.text :add_task_comment
      t.integer :user_id

      t.timestamps
    end
  end
end
