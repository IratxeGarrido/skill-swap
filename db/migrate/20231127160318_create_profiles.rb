class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :bio
      t.integer :age
      t.integer :gender
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
