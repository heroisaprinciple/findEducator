class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :meeting_link
      t.integer :status
      t.string :description
      t.references :mentor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
