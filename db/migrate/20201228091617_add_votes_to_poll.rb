class AddVotesToPoll < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :votes, :text
  end
end
