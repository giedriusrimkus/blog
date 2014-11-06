class AddSlugColumnToArticles < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string, unique: true
    add_index :posts, :slug, unique: true
  end
end