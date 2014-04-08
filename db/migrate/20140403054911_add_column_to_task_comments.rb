class AddColumnToTaskComments < ActiveRecord::Migration
  def change
    add_column :task_comments, :task_comment_created_by, :string
  end
end
