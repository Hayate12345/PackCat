class Interest < ApplicationRecord
  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * usersテーブルとのアソシエーション (interestsテーブルからみて、usersテーブルは1の関係)
  belongs_to :user
  # * eventsテーブルとのアソシエーション （interestsテーブルから見て、eventsテーブルは1の関係）
  belongs_to :event
end
