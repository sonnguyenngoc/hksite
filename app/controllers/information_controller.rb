class InformationController < ApplicationController
  def policy_1
    @menus = Menu.get_menus
    @title = 'Hướng dẫn mua hàng'
  end
  
  def policy_2
    @menus = Menu.get_menus
    @title = 'Hướng dẫn thanh toán'
  end
  
  def policy_3
    @menus = Menu.get_menus
    @title = 'Chính sách vận chuyển, giao nhận'
  end
  
  def policy_4
    @menus = Menu.get_menus
    @title = 'Chính sách bảo hành'
  end
  
  def policy_5
    @menus = Menu.get_menus
    @title = 'Chính sách đổi trả hàng, hoàn tiền'
  end
  
  def policy_6
    @menus = Menu.get_menus
    @title = 'Quy định bảo mật thông tin'
  end
  
  def policy_7
    @menus = Menu.get_menus
    @title = 'Quy chế hoạt động trang TMĐT'
  end
  
  def policy_8
    @menus = Menu.get_menus
    @title = 'Các điều khoản & điều kiện'
  end
  
  def policy_9
    @menus = Menu.get_menus
    @title = 'Câu hỏi thường gặp'
  end
end
