class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart       
  # belongs_to :cart,
  # has_many :items, through: :cart

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  after_create :create_empty_cart, :welcome_send

  def create_empty_cart
    Cart.create(user: self, price: 0)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
