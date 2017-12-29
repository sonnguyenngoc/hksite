class ProductController < ApplicationController
  include ApplicationHelper

  def index
    @menus = Menu.get_menus
    @product = Product.find(params[:id])
    @title = @product.display_name
  end

  def quickview
    @product = Product.find(params[:id])

    render layout: nil
  end

  def autosearch
    @products = Product.search(params).limit(10)

    render json: @products.map { |product| {
      name: product.display_name,
      price: (!product.has_price ? 'Liên hệ' : (view_context.number_to_currency(product.display_custom_price, precision: 0, format: "%n₫", separator: ',', unit: '', delimiter: "."))),
      #is_deal: product.is_deal,
      old_price: (product.check_product_sale ? view_context.format_price(product.product_info.old_price) + "₫" : 'null'),
      #deal_percent: (product.deal_percent if product.is_deal),
      link: view_context.url_for({controller: "product", action: "index", id: product.id, title: url_friendly(view_context.strip_tags(product.display_name))}),
      #is_sold_out: product.is_sold_out,
      image: (!product.product_image.id.nil? ? product.product_image.image(:thumb60) : '/hksite/images/no-image/thumb-60.png'),
    }}
  end
end
