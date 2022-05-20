class Exercise < ApplicationRecord
    belongs_to :user

    validates_presence_of :name

    enum visibility: {just_me: 0, friends: 1, everyone: 2}
    enum exercise_type: {anaerobic: 0, aerobic: 1}

    scope :public_exercises, ->() {where(visibility: 2)}

end
