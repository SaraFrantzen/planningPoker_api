class AddResultToPoll < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :result, :integer
  end
end
