class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  #has_ancestry
  has_many :articles
end
