class Customer < ApplicationRecord

  validates :is_deleted, inclusion: { in: [true, false] }
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end