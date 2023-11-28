class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :age
      t.string :gender
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
