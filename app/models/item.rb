class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_many   :comments
  has_one_attached :image

  with_options presence: true do
    validates :name, message: 'は必須項目です。'
    validates :text
    validates :genre_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_date_id
    validates :shipping_place_id
    validates :price, numericality:{only_integer:true, greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
  end
  
end
