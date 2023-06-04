class AddDetailsToMentors < ActiveRecord::Migration[7.0]
  def change
    add_column :mentors, :first_name, :string
    add_column :mentors, :last_name, :string
    add_column :mentors, :occupation, :string
    add_column :mentors, :token, :string
    add_reference :mentors, :subject, null: false, foreign_key: true
  end
end
