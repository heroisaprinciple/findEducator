class AddFieldsToAvailabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :month, :integer
    add_column :availabilities, :year, :integer
    add_column :availabilities, :status, :integer
  end
end
