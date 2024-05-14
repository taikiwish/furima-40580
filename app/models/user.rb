class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday, presence: true
  validates :familyname_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角カタカナで入力してください" }
  validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で入力してください" }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "半角英数字混合で入力してください" }
end
