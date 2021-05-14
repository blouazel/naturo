class MigrateDescriptiontoRichBodyArticles < ActiveRecord::Migration[6.0]
  def up
    Article.find_each do |article|
      article.update(rich_body: article.description)
    end
  end

  def down
    Article.find_each do |article|
      article.update(description: article.rich_body)
      article.update(rich_body: nil)
    end
  end
end
