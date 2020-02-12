# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

module UrlParser
  module_function

  def url_info(url)
    return '' unless validate_url(url)

    info = {}
    URI.open(url) do |f|
      info[:url] = f.base_uri.to_s
      info[:status] = f.status.first.to_i
      info[:title] = Nokogiri::HTML.parse(f).title
    end

    info
  end

  def validate_url(url)
    uri = URI.parse(url)

    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
