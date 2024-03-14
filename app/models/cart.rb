class Cart < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  extend FriendlyId
  friendly_id :title, use: :slugged
end
