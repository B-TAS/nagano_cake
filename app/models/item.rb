class Item < ApplicationRecord
  has_one_attached :image
  enum is_active: { in_store_now: 0, sold_out: 1 }
end
