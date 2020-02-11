# frozen_string_literal: true

require 'roda'
require_relative 'db'

class App < Roda

  Dir['./lib/*.rb'].each { |file| require file }

  plugin :multi_route
  plugin :path

  path :root, '/'

  route do |r|
    r.root do
      'Root path'
    end
  end
end
