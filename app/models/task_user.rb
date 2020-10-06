class TaskUser < ApplicationRecord
  belongs_to :users
  belongs_to :tasks
  has_many :tasks
end
