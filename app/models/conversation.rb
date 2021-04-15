class Conversation < ApplicationRecord
  belongs_to :contact
  has_many :posts, -> { order(created_at: :asc) }, dependent: :destroy

  def authors
    posts.includes(:author).map(&:author).uniq
  end
end
