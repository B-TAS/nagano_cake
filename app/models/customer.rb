class Customer < ApplicationRecord

  validates :is_deleted, inclusion: { in: [true, false] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
