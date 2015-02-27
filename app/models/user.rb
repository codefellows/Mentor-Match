class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :course, presence: true, if: :mentee?
  validates :email, presence: true
  validates :password, length: { minimum: 6 },
                       confirmation: true,
                       if: -> { new_record? || !password.nil? }

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: :"Friendship",
                                 foreign_key: :"friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include Gravtastic
  gravtastic

  include PgSearch
  pg_search_scope :super_search,
                  against: [:first_name, :last_name, :course, :background,
                            :professional_summary, :accomplishments,
                            :personal_statement, :company, :position,
                            :technologies],
                  using: { tsearch: { dictionary: 'english', prefix: true } }

  acts_as_votable
  acts_as_voter

  def self.search(query)
    query.present? ? super_search(query) : order('users.created_at DESC').all
  end

  def first_name=(new_name)
    self[:first_name] = new_name.capitalize
  end

  def last_name=(new_name)
    self[:last_name] = new_name.capitalize
  end

  def mentor?
    role == 'mentor'
  end

  def mentee?
    role == 'mentee'
  end

  def admin?
    admin == true
  end

  def can_request?(user)
    !friends.include?(user) && !inverse_friends.include?(user) && user != self
  end

  def change_availability
    available == true ? false : true
  end

  def display_availability
    available == true ? 'available' : 'unavailable'
  end

  def opposite_role
    role == 'mentor' ? 'mentee' : 'mentor'
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    encrypted_password.blank? ? update_attributes(params, *options) : super
  end

  def fullname
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def accepted_friends
    friend_ids.map { |id| User.find(id) }
  end

  def friend_ids
    id_collection = []
    inverse_friendships.each do |friend|
      id_collection << friend.user_id if friend.state == 'Accepted'
    end
    friendships.each do |friend|
      id_collection << friend.friend_id if friend.state == 'Accepted'
    end
    id_collection
  end

  def find_friendship(user)
    f_ships = friendships.where(friend_id: user.id, state: 'Accepted')
    inverse = inverse_friendships.where(user_id: user.id, state: 'Accepted')
    friendship = (f_ships + inverse).first
    return nil if friendship.nil?
    friendship
  end
end
