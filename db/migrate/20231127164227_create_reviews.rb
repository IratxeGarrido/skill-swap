class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :reviewer, null: false, foreign_key: { to_table: :profiles }
      t.references :reviewee, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
