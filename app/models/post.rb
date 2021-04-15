class Post < ApplicationRecord
  belongs_to :conversation
  belongs_to :author, polymorphic: true
  has_rich_text :body
  has_many_attached :attachments

  validates :body, presence: true

  broadcasts_to :conversation
end
