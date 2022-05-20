class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :visibility, default: 0
      t.integer :exercise_type, default: 0

      t.timestamps
    end
  end
end
