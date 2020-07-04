class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #EmailAddressとPassWordはconfig/initializers/devise.rbを参照ください。
  validates :name,
            length: { minimum: 2, maximum: 20 }

end