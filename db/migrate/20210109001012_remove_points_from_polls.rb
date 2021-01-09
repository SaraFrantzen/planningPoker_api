class RemovePointsFromPolls < ActiveRecord::Migration[6.0]
  def change
    remove_column :polls, :points, :integer
  end
end
