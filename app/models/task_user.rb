class TaskUser < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :tasks
end
