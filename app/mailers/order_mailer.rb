class OrderMailer < ApplicationMailer
  def customer_order_email(customer_order)
    @customer_order = customer_order
    mail(to: "sonnn@hoangkhang.com.vn", subject: @customer_order.created_at.utc.in_time_zone("Hanoi").strftime("%Y%m%d%H%M")+" - Đơn Đặt Hàng")
  end
  
  def confirm_customer_order_email(customer_order)
    @customer_order = customer_order
    mail(to: @customer_order.orderer_email, subject: @customer_order.created_at.utc.in_time_zone("Hanoi").strftime("%Y%m%d%H%M")+" - Xác Nhận Đặt Hàng Thành Công")    
  end
end
