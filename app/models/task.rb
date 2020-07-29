class Task < ApplicationRecord
<<<<<<< HEAD
  has_many Task_users
  has_many :Users, through: :Task_users
  accepts_nested_attributes_for :Task_users
=======
  has_many :task_users
>>>>>>> master
end
