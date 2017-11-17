require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://store.hoangkhang.com.vn/'
SitemapGenerator::Interpreter.send :include, ApplicationHelper
SitemapGenerator::Sitemap.create do
  add about_us_path
  add contact_path
  add blog_listing_path
  add policy_1_path
  add policy_2_path
  add policy_3_path
  add policy_4_path
  add policy_5_path
  add policy_6_path
  add policy_7_path
  add policy_8_path
  add policy_9_path
  
  Menu.get_all_menus.each do |menu|
    add category_path(id: menu.id, title: menu.name_url)
  end
  
  Product.get_all.each do |product|
    add product_path(id: product.id, title: url_friendly(product.display_name))
  end
  
end