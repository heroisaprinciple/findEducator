class RenameAppointementsToAppointments < ActiveRecord::Migration[7.0]
  def change
    rename_table :appointements, :appointments
  end
end
