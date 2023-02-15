class Post < ApplicationRecord
  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * usersテーブルとのアソシエーション (postsテーブルからみて、usersテーブルは1の関係)
  belongs_to :user
  # * likesテーブルとのアソシエーション （postsテーブルから見て、likesテーブルは多の関係）
  has_many :likes
  # * commentsテーブルとのアソシエーション （postsテーブルから見て、commentsテーブルは多の関係）
  has_many :comments

  # ! バリデーションの定義
  validates :content, presence: true
  validates :image, presence: true
  validates :amount, presence: true
  validates :place, presence: true

  # ! 画像投稿用の定義
  mount_uploader :image, ImageUploader
end
