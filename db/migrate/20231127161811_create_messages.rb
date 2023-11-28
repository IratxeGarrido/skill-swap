class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.boolean :read_status
      t.references :match, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :profiles }
      t.references :recipient, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
