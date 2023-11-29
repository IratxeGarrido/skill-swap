class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.text :description
      t.string :category
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
