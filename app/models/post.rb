class Post < ApplicationRecord
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :notices, dependent: :destroy
	belongs_to :user
	acts_as_taggable
	attachment :post_image
	def favorite_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def created_notice_favorite!(current_user)
		tmp = Notice.where(["visitor_id = ? & visited_id = ? & post_id = ? & action = ?", current_user.id, user_id, id, "favorite"])
		if tmp.blank?
			notice = current_user.active_notice.new(
				post_id: id,
				visited_id: user_id,
				action: "favorite"
			)
			if notice.visitor_id == notice.visited_id
				notice.checked = true
			end
			notice.save if notice.valid?
		end
	end

	def created_notice_comment!(current_user, post_comment_id)
		tmp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
		tmp_ids.each do |tmp_id|
			save_notice_comment!(current_user,post_comment_id, tmp_id)["user_id"]
		end
		save_notice_comment!(current_user,post_comment_id, user_id) if tmp_ids.blank?
	end

	def save_notice_comment!(current_user, post_comment_id, visited_id)
		notice = current_user.active_notice.new(
			post_id: id,
			post_comment_id: post_comment_id,
			visited_id: visited_id,
			action: "comment"
			)
		if notice.visitor_id == notice.visited_id
			notice.checked = true
		end
		notice.save if notice.valid?
	end
end
