# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  def created_notice_follow!(current_user, user_id)
    tmp = Notice.where(["visitor_id = ? & visited_id = ? & action = ?", current_user.id, user_id, "follow"])
    if tmp.blank?
      notice = current_user.active_notice.new(
        visited_id: user_id,
        action: "follow"
      )
      notice.save if notice.valid?
    end
  end
end
