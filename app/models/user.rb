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
end
