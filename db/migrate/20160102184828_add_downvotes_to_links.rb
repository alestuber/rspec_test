class AddDownvotesToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :downvotes, :integer
  end
end
