class RemoveTokenFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :token, :string
    remove_column :mentors, :token, :string
  end
end
