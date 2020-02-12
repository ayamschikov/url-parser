# frozen_string_literal: true

require 'roda'
require_relative 'db'
require_relative 'lib/url_parser'

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

        r.params['urls'].each do |u|
          Site.create(UrlParser.url_info(u))
        end

        'Parsed'
      end
    end
  end
end
