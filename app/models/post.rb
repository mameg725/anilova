class Post < ApplicationRecord
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	belongs_to :user
	acts_as_taggable
	attachment :post_image
	def favorite_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
