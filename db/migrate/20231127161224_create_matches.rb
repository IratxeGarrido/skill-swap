class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :status
      t.references :initiator, null: false, foreign_key: { to_table: :profiles }
      t.references :creator, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
