# frozen_string_literal: true

class News < ApplicationRecord
  has_many :notices, dependent: :destroy
  belongs_to :user
  validates :title, length: { in: 10..20, message: "10~20字までで入力してください。" }
  validates :news_text, length: { in: 10..1000, message: "10~1000字までで入力してください。" }
end
