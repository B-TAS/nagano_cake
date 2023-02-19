class Item < ApplicationRecord
  has_one_attached :image
  enum is_active: { in_store_now: 0, sold_out: 1 }
  enum payment_method: { credit_card: 0, transfer: 1 }
end
