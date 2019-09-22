class AddIndexToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_index :articles, :author_id
  end
end
