class CreatePeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
    add_index :peeps, [:user_id, :created_at]
  end
end
