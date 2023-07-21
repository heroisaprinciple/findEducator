class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :amount
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
