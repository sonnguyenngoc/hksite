module ApplicationHelper
    # convert string to url friendly string
    def url_friendly(string)
      string.unaccent.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end
    
    def format_price(price)
      price = (price.to_f/1000).round*1000
      "<span style=\'font-family:sans-serif;\'>#{number_to_currency(price, precision: 0, format: "%n₫", separator: ',', unit: '', delimiter: ".")}</span>".html_safe
    end
end
