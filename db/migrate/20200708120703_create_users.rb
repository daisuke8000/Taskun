class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :image
      t.string :belongs
      t.string :message

      t.timestamps
    end
  end
end
