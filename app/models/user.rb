class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :products
  has_many :orders

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./.freeze
  FAMILY_FIRST_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  FAMILY_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, format: { with: PASSWORD_REGEX }
    validates :password_confirmation, confirmation: true
    validates :birthday
  end

  with_options format: { with: FAMILY_FIRST_NAME_REGEX } do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: FAMILY_FIRST_NAME_KANA_REGEX } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
