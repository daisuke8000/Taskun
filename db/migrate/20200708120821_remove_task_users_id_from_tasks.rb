class RemoveTaskUsersIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :Task_users_id, :integer
  end
end
