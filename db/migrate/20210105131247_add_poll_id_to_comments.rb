class AddPollIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :poll_id, :integer
  end
end
