class CreateExerciseRoutineExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_routine_exercises do |t|
        t.integer :exercise_routine_id
        t.integer :exercise_id
        t.integer :exercise_number

        t.timestamps
    end
  end
end
