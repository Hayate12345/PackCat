class User < ApplicationRecord
  # ! バリデーションの定義
  validates :name, presence: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  # ! アソシエーションの定義 (has_manyは複数形、belongs_toは単数形で記述)
  # * postsテーブルとのアソシエーション (usersテーブルからみて、postsテーブルは多の関係)
  has_many :posts
end
