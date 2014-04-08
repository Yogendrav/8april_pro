class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_status, :string
  end
end
