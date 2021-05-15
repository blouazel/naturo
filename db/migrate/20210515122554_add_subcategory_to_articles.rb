class AddSubcategoryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :subcategory, foreign_key: true
  end
end
