class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id, uniqueness: true
  has_many :cart_items
  has_many :items, through: :cart_items
end
