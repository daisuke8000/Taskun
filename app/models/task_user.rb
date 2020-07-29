class TaskUser < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  belongs_to :task
=======
  has_many :tasks
>>>>>>> master
end
