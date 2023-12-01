class RemoveRecepientFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :recipient_id 
  end
end
