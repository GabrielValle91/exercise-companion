class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, class_name: 'User'
  
    validates_presence_of :user_id, :friend_id
    validate :user_and_friend_are_not_equal
    validates_uniqueness_of :user_id, scope: [:friend_id]
  
    def is_mutual
      self.friend.friends.include?(self.user)
    end
  
    private
    def user_and_friend_are_not_equal
      errors.add(:friend, "can't be the same as the user") if self.user == self.friend
    end
  
  end