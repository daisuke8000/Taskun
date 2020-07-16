class Task < ApplicationRecord
  has_many Task_users
  has_many :Users, through: :Task_users
  accepts_nested_attributes_for :Task_users
end
