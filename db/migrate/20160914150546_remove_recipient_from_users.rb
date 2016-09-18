class RemoveRecipientFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :recipient, :string
  end
end
