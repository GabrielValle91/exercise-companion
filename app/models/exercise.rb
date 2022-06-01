class Exercise < ApplicationRecord
    belongs_to :user
    has_many :exercise_routine_exercises
    has_many :exercise_routines, through: :exercise_routine_exercises

    validates_presence_of :name

    enum visibility: {just_me: 0, friends: 1, everyone: 2}
    enum exercise_type: {anaerobic: 0, aerobic: 1}

    scope :public_exercises, ->() {where(visibility: 2)}
    scope :friend_exercises, ->(user) {where(user_id: user.id, visibility: 1)}
end
