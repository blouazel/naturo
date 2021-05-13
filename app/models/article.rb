class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :category, presence: true
  belongs_to :user, optional: true

end