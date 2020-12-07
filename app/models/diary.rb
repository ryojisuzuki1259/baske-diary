class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user) #ダイアリーに対するいいねのため、diaryモデルに定義する。ビューはuser/show
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true
end
