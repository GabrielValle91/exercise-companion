class CreateExerciseRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_routines do |t|
      t.string :name
      t.string :description
      t.integer :visibility, default: 0
      t.integer :user_id

      t.timestamps
    end
    add_index :exercise_routines, :name
  end
end
