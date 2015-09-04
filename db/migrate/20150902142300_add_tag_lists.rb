class AddTagLists < ActiveRecord::Migration
  def change
        change_table :posts do |t|
           t.string :tag_list
    end
  end
end
