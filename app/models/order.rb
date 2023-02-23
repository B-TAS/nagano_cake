class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum order_method: { credit_card: 0, transfer: 1 }
  
  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
end
