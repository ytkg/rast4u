class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :bookmark_id
      t.string :title
      t.string :url
      t.text :description
      t.string :image_url
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
