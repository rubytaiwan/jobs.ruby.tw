# -*- encoding : utf-8 -*-
SeoHelper.configure do |config|
  config.skip_blank               = false
  config.site_name = Setting.app_name
  config.default_page_description = "Job board for  Ruby and Rails developers in Taiwan"
  config.default_page_keywords    = "Ruby, Rails, Taiwan, Job, Rails Developer"
  config.default_page_image = Setting.domain + Setting.default_logo_url
  config.site_name_formatter  = lambda { |title, site_name|   "#{title} « #{site_name}".html_safe }
  config.pagination_formatter = lambda { |title, page_number| "#{title} - Page No.#{page_number}" }

end
