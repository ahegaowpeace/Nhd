class CreateCmtrelations < ActiveRecord::Migration[6.0]
  def change
    create_table :cmtrelations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
