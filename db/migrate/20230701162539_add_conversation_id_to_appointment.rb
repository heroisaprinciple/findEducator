class AddConversationIdToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :conversation, foreign_key: true, null: false
  end
end
