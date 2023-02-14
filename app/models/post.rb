class Post < ApplicationRecord
  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * usersテーブルとのアソシエーション (postsテーブルからみて、usersテーブルは1の関係)
  belongs_to :user
end
