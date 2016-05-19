class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|
      t.string :height
      t.string :weight
      t.float :bmi
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :healths, [:user_id, :created_at]
  end
end
