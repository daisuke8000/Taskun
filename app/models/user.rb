class User < ApplicationRecord
  has_many Task_users
  has_many :Tasks, through: :Task_users
  accepts_nested_attributes_for :Task_users
end
