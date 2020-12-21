class AddPointsToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :points, :integer, array: true, default: []
  end
end
