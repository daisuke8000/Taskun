class AddReferencesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :category, null: false, foreign_key: true
  end
end
