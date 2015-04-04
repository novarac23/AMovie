class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :text
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
