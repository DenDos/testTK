class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :content
      t.string :shortContent, :null => false
      t.string :category

      t.timestamps null: false
    end
  end
end
