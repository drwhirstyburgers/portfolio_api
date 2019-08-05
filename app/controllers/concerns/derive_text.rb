module DeriveText
    extend ActiveSupport::Concern
    require 'open-uri'

    def self.get_content(url)
        doc = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
        the_css = doc.css('p')
        ub = Sanitize.fragment(the_css, :elements => ['p']).split(' ')
        ub = ub.join(' ').split('</p>').map { |x| x + '</p>' }
        content = ub.join(' ')

        return content
    end
end