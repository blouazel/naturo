class RemoveAncestryFromCategory < ActiveRecord::Migration[6.0]
  def change
     remove_column :categories, :ancestry, :string
  end
end
