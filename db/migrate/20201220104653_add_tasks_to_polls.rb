class AddTasksToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :tasks, :text
  end
end
