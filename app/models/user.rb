class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
