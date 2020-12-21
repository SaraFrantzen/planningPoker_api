class AddTeamToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :team, :integer, array: true, default: []
  end
end
