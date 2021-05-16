class Article < ApplicationRecord
  has_rich_text :rich_body
  #has_one_attached :photo
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :rich_body, presence: true, length: { minimum: 50 }
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :subcategory
end
