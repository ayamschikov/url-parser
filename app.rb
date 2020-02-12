# frozen_string_literal: true

require 'roda'
require_relative 'db'

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

        urls = r.params['urls']
        urls.each { |u| Site.create(url: u, title: 'te', status: 200) }

        'Parsed'
      end
    end
  end
end
