class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_place

  belongs_to :user
  has_one    :order
  has_many   :comments
  has_one_attached :image

  def self.search(search)
    if search != ''
      Item.where('text LIKE(?) OR name LIKE(?)',"%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000}
    validates :price, format: { with: /[0-9]/ }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '価格は半角数字で記入し、300〜9,999,999円にしてください' }

    with_options numericality: { other_than: 0, message: 'は選択しないと出品できません'} do
      validates :genre_id
      validates :condition_id
      validates :shipping_charge_id
      validates :shipping_date_id
      validates :shipping_place_id
    end
  end
end
