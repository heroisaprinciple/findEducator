class CreatePersonalMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_messages do |t|
      t.string :content
      t.datetime :sent_at
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
