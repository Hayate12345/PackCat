class Comment < ApplicationRecord
  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * usersテーブルとのアソシエーション (likesテーブルからみて、usersテーブルは1の関係)
  belongs_to :user
  # * postsテーブルとのアソシエーション （likesテーブルから見て、postsテーブルは1の関係）
  belongs_to :post

  # ! バリデーションの定義
  validates :comment, presence: true
end
