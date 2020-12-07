class DiaryComment < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  validates :body, presence: true
end
