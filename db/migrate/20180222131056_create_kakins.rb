class CreateKakins < ActiveRecord::Migration[5.0]
  def change
    create_table :kakins do |t|
      t.integer :user_id
      t.date :date
      t.decimal :amount
      t.integer :game_id
      t.text :comment

      t.timestamps
    end
  end
end
