class OrderMailer < ApplicationMailer
  default from: 'sonnn@hoangkhang.com.vn'
  
  def customer_order_email(customer_order)
    @customer_order = customer_order
    mail(to: "sonnn@hoangkhang.com.vn", subject: "Đơn đặt hàng")
  end
end
