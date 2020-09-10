class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :purchase

  with_options presence: true do
    validates :nickname
    validates :birthday
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、全角カタカナ、漢字で記入してください。' } do
      validates :family_name
      validates :first_name
    end
    

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで記入してください。'} do
      validates :family_name_reading
      validates :first_name_reading
    end
  end
end
