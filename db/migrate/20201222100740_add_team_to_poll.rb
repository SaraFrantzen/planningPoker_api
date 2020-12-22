class AddTeamToPoll < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :team, :string, array: true, default: []
  end
end
