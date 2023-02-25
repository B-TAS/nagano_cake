class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  # cart_itemを通してcustomerに接続
  has_many :customers, through: :cart_items
  has_one_attached :image
  has_many :order_detail
  # validates :name, presence: true #<=他カラムの記述
  validates :is_active, inclusion: { in: [true, false] }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 消費税計算メソッド
  def with_tax_price
    (price*1.1).floor
  end

end
