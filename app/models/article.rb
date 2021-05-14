class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :rich_body, presence: true, length: { minimum: 50 }
  validates :category, presence: true
  belongs_to :user, optional: true
  has_rich_text :rich_body

  #CATEGORIES = ['Santé', 'Santé au féminin', 'Recettes', 'Bien-être', 'Lifestyle']
end
