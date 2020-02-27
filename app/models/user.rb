# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:friendly_url]
  validates :name, presence: true, length: { in: 1..10 }
  validates :friendly_url, presence: true, length: { in: 3..10 },
                           format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字で3~10文字で入力してください。" }
  validates :introduction, length: { maximum: 100, message: "100字までで入力してください。" }

  acts_as_paranoid

  include FriendlyId
  friendly_id :friendly_url

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :active_notice, class_name: "Notice", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notice, class_name: "Notice", foreign_key: "visited_id", dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  attachment :icon_image

  def follow(user_id)
    follower.create(followed_id: user_id)
    # created_notice_follow!(current_user)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def created_notice_follow!(current_user)
    tmp = Notice.where(["visitor_id = ? & visited_id = ? & action = ?", current_user.id, id, "follow"])
    if tmp.blank?
      notice = current_user.active_notice.new(
        visited_id: id,
        action: "follow"
      )
      notice.save if notice.valid?
    end
  end
end
