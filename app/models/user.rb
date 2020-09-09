class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :purchase
  
  # with_options presence: true do
  # validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  # validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  # validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  # end

  with_options presence: true do
   validates :family_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角ひらがな、全角カタカナ、漢字で記入してください。"}
   validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角ひらがな、全角カタカナ、漢字で記入してください。"}
   validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで記入してください。"}
   validates :first_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで記入してください。"}  
   validates :password,            format: { with: /\A[a-z\d]{8,100}+\z/i, message: "は半角英数で6文字以上100文字以下で記入してください。"}
  end
  validates :nickname,presence: true
  validates :birthday,presence: true

end

