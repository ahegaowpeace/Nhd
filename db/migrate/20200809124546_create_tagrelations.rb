class CreateTagrelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tagrelations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
