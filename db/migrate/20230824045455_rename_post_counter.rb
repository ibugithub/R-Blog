class RenamePostCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :PostCounter, :posts_counter
  end
end
