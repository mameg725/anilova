class PostComment < ApplicationRecord
	has_many :notices, dependent: :destroy
	belongs_to :user
	belongs_to :post
	validates :reaction, length: {maximum: 100, message: "100字までで入力してください。"}
end
