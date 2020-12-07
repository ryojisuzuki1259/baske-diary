class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :following
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :follower

  def self.search_for(content, method, column)
    if column == 'name'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content + '%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%' + content)
      else
        User.where('name LIKE ?', '%' + content + '%')
      end
    elsif column == 'organization'
      if method == 'perfect'
        User.where(organization: content)
      elsif method == 'forward'
        User.where('organization LIKE ?', content + '%')
      elsif method == 'backward'
        User.where('organization LIKE ?', '%' + content)
      else
        User.where('organization LIKE ?', '%' + content + '%')
      end
    else
      if method == 'perfect'
        User.where(prefecture: content)
      elsif method == 'forward'
        User.where('prefecture LIKE ?', content + '%')
      elsif method == 'backward'
        User.where('prefecture LIKE ?', '%' + content)
      else
        User.where('prefecture LIKE ?', '%' + content + '%')
      end
    end
  end
  #Userモデルを検索するインスタンスメソッドを定義。ビューから送られてきた引数３つによって条件分岐をする。
  #columnで名前か活動エリアかを分岐、methodで完全一致などの検索方法を分岐、contentでどんなワードなのかを判断。

  def follow(user_id)
    relationships.create(follower_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(follower_id: user_id).destroy
  end

  def following?(other_user)
    relationships.find_by(follower_id: other_user.id)
  end

end
