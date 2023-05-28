class ChangeFirstnameToFirstName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :firstname, :first_name
  end
end
