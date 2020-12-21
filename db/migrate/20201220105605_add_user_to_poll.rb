class AddUserToPoll < ActiveRecord::Migration[6.0]
  def change
    add_reference :polls, :user, foreign_key: { to_table: :users }
  end
end
