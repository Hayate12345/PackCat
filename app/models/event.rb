class Event < ApplicationRecord
  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * usersテーブルとのアソシエーション (eventsテーブルからみて、usersテーブルは1の関係)
  belongs_to :user

  # ! バリデーションの定義
  validates :title, presence: true
  validates :content, presence: true
  validates :belongings, presence: true
  validates :place, presence: true
end
