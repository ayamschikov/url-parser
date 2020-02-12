# frozen_string_literal: true

module SiteService
  module_function

  def upload_sites_by_urls(urls)
    threads = []

    urls.each do |url|
      threads << Thread.new { Site.create(UrlParser.url_info(url)) }
    end

    threads.each(&:join)
  end
end
