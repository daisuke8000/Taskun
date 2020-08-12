class Category < ApplicationRecord
  has_many :tasks

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      Category.all
    end
  end
end
