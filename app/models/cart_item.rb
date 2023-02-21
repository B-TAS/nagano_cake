class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  has_one_attached :image

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price*amount
  end

end
