class Task < ApplicationRecord
  has_many :task_users
  has_many :User, through: :Task_users
  belongs_to :category
  # accepts_nested_attributes_for :Task_users
end
