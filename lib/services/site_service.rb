# frozen_string_literal: true

module SiteService
  module_function

  def upload_sites_by_urls(urls)
    pool = ThreadPool.new(10)

    urls.each do |url|
      pool.schedule do
        url_info = UrlParser.url_info(url)
        Site.create(url_info) unless url_info.empty?
      end
    end

    pool.run!
  end
end
