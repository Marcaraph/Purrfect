class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy     
  has_many :orders, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  after_create :create_empty_cart, :welcome_send

  extend FriendlyId
  friendly_id :email, use: :slugged

  def create_empty_cart
    Cart.create(user: self, price: 0, title: "my_cart")
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  before_create :default_admin
  def default_admin
    self.admin ||= false
  end

end
