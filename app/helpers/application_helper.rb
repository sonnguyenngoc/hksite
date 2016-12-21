module ApplicationHelper
    # convert string to url friendly string
    def url_friendly(string)
      string.unaccent.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end
end
