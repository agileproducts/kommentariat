class Comment < ApplicationRecord
  belongs_to :conversation

  validates :commenter, presence: true
end
