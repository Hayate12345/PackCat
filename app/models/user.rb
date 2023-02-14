class User < ApplicationRecord
  # ! バリデーションの設定
  validates :name, presence: true
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
end
