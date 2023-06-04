class CreateJoinTableMentorsSubjects < ActiveRecord::Migration[7.0]
  def change
    create_join_table :mentors, :subjects do |t|
      t.index [:mentor_id, :subject_id]
      t.index [:subject_id, :mentor_id]
    end
  end
end
