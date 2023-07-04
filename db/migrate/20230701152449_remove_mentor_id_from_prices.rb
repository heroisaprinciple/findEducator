class RemoveMentorIdFromPrices < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :prices, :mentors, column: :mentor_id
  end
end
