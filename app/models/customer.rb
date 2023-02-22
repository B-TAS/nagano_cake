class Customer < ApplicationRecord

  enum membership: { enabled: 0, disabled: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
