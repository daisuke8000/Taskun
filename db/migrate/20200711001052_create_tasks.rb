class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :task_users_id
      t.string :task_name
      t.string :status
      t.string :message
      t.datetime :end_date
      t.string :temp_memo
      t.datetime :start_date
      t.string :priority
      t.string :cont_memo
      t.string :amcestry

      t.timestamps
    end
  end
end
