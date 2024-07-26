class AddFileToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :file, :string
  end
end
