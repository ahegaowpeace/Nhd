class CreateArtrelations < ActiveRecord::Migration[6.0]
  def change
    create_table :artrelations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
