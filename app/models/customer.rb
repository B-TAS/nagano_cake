class Customer < ApplicationRecord

<<<<<<< HEAD
  enum membership: { enabled: 0, disabled: 1 }
=======
  validates :is_deleted, inclusion: { in: [true, false] }
>>>>>>> origin/develop

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
end
