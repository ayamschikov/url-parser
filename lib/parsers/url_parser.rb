# frozen_string_literal: true

module UrlParser
  module_function

  def url_info(url)
    return '' unless validate_url(url)

    info = {}

    uri = URI.parse(url)

    response = Net::HTTP.get_response(uri)

    info[:status] = response.code.to_i
    info[:title] = info[:status] != 200 ? '' : Nokogiri::HTML.parse(response.body).title
    info[:url] = url

    info
  end

  def validate_url(url)
    uri = URI.parse(url)

    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
