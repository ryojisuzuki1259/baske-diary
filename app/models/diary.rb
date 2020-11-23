class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
