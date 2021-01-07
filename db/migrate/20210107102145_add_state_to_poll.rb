class AddStateToPoll < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :state, :integer, default: 0
  end
end
