class Subcategory < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  belongs_to :category
  has_many :articles
end
