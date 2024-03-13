class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    has_many :items, through: :order_items

    after_create :send_order_emails

    def send_order_emails
        UserMailer.user_order_email(self.user).deliver_now
        UserMailer.admin_order_email.deliver_now
    end 
end