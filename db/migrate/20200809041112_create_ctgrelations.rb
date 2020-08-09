class CreateCtgrelations < ActiveRecord::Migration[6.0]
  def change
    create_table :ctgrelations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
