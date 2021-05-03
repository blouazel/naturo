class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :reading_time
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
