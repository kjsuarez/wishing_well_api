class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :wish_maker_name
      t.string :wish_text
      t.integer :wish_amount

      t.timestamps
    end
  end
end
