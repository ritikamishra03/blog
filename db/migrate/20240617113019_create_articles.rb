class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :article
      t.text :body


      t.timestamps
    end
  end
end
