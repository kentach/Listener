class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true, length: { maximum: 50 }
  validates :eiken_level, presence: true
  validates :school_grade, presence: true
end