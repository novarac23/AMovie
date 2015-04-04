class RenameColumnInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :movie_id
  end
end
