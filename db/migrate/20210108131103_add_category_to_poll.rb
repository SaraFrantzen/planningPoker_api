class AddCategoryToPoll < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :category, :integer
  end
end
