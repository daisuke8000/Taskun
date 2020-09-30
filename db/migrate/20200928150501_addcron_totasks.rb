class AddcronTotasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :is_cron, :string

    add_column :tasks, :is_share, :string
  end
end
