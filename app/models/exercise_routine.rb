class ExerciseRoutine < ApplicationRecord
    has_many :exercise_routine_exercises, -> { order(exercise_number: :asc)}
    has_many :exercises, through: :exercise_routine_exercises
    belongs_to :user

    enum visibility: {just_me: 0, friends: 1, everyone: 2}

    scope :public_exercise_routines, ->() {where(visibility: 2)}
    scope :friend_exercise_routines, ->(user) {where(user_id: user.id, visibility: 1)}


    def remove_exercise_from_routine(exercise_number)
        aray = exercise_routine_exercises.slice(exercise_number, exercise_routine_exercises.size - exercise_number)
        aray.each do |ere|
            ere.exercise_number -= 1
            ere.save
        end
    end
end
