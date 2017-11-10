class OrderMailer < ApplicationMailer
  def customer_order_email(customer_order)
    @customer_order = customer_order
    mail(to: "sonnn@hoangkhang.com.vn", subject: @customer_order.created_at.utc.in_time_zone("Hanoi").strftime("%Y%m%d%H%M")+" - ĐƠN ĐẶT HÀNG")
  end
end
