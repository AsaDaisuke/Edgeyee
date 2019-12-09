class AddIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :number, :integer
  end
end
