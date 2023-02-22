class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  # validates :name, presence: true #<=他カラムの記述
  validates :is_active, inclusion: { in: [true, false] }

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
