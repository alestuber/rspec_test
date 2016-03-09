class AddVotesToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :votes, :integer
  end
end
