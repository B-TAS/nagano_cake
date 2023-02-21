class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  # cart_itemを通してcustomerに接続
  has_many :customers, through: :cart_items
  has_one_attached :image
  enum is_active: { in_store_now: 0, sold_out: 1 }

  # 消費税計算メソッド
  def with_tax_price
    (price*1.1).floor
  end
end
