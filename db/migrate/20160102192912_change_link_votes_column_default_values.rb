class ChangeLinkVotesColumnDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :links, :downvotes, :integer, :default => 0, :null => false
    change_column :links, :votes, :integer, :default => 0, :null => false
  end
end
