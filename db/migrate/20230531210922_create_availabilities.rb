class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.references :mentor, null: false, foreign_key: true
      t.string :day
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
