class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :received_friends, through: :received_friendships, source: 'user'

    scope :all_except, ->(user) { where.not(id: user) }

    def active_friends
        friends.select{ |friend| friend.friends.include?(self) }  
    end

    def pending_friends
        friends.select{ |friend| !friend.friends.include?(self) }  
    end

    def full_name
        "#{first_name} #{last_name}"
    end

    def get_friendship(friend)
        friendships.select { |friendship| friendship.friend_id == friend.id}
    end
end
