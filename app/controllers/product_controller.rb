class ProductController < ApplicationController
  include ApplicationHelper

  def index
    @product = Product.find(params[:id])
  end

  def quickview
    @product = Product.find(params[:id])

    render layout: nil
  end

  def autosearch
    @products = Product.search(params).limit(10)

    render json: @products.map { |product| {
      name: product.display_name,
      price: (!product.has_price ? 'Liên hệ' : (view_context.number_with_delimiter(product.display_price))) + "₫",
      #is_deal: product.is_deal,
      old_price: (!product.get_old_price.nil? ? view_context.number_with_delimiter(product.get_old_price.price.to_i) + "₫" : 'null'),
      #deal_percent: (product.deal_percent if product.is_deal),
      link: view_context.url_for({controller: "product", action: "index", id: product.id, title: url_friendly(view_context.strip_tags(product.display_name))}),
      #is_sold_out: product.is_sold_out,
      image: product.product_image.image(:thumb60),
    }}
  end
end
