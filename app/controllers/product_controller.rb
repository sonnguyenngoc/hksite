class ProductController < ApplicationController
  include ApplicationHelper

  def index    
    @product = Product.find(params[:id])
    if @product.status == 0 || @product.in_use == false
      render(:status => 404)
    else
      @menus = Menu.get_menus
      @title = @product.display_name
      if @product.find_menu.present?
        @menu = Menu.find(@product.find_menu)
        @meta_keywords = @menu.meta_keywords
        @meta_description = @menu.meta_description
      end
    end    
  end

  def quickview
    @product = Product.find(params[:id])

    render layout: nil
  end

  def autosearch
    @products = Product.search(params).limit(10)

    render json: @products.map { |product| {
      name: product.display_name,
      price: (!product.has_price ? 'Liên hệ: (028) 3984 7690' : (view_context.format_price(product.display_custom_price))),
      #is_deal: product.is_deal,
      old_price: (product.check_product_sale ? view_context.format_price(product.product_info.old_price) : 'null'),
      #deal_percent: (product.deal_percent if product.is_deal),
      link: view_context.url_for({controller: "product", action: "index", id: product.id, title: product.alias}),
      #is_sold_out: product.is_sold_out,
      image: (!product.product_image.id.nil? ? product.product_image.image(:thumb60) : '/hksite/images/no-image/thumb-60.png'),
    }}
  end
end
