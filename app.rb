# frozen_string_literal: true

require 'roda'
require_relative 'db'
require_relative 'lib/url_parser'
require_relative 'lib/site_service'

class App < Roda
  plugin :multi_route
  plugin :path

  path :root, '/'

  route do |r|
    r.root do
      'Root path'
    end

    r.on 'sites' do
      r.post do
        SiteService.upload_sites_by_urls(r.params['urls'])

        'Parsed'
      end
    end
  end
end
