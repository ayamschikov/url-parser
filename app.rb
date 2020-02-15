# frozen_string_literal: true

require 'roda'
require 'require_all'
require_relative 'db'
require_all 'lib'
require_all 'models'

class App < Roda
  plugin :multi_route
  plugin :path

  require_all 'routes'

  path :root, '/'

  route do |r|
    r.root do
      'Root path'
    end

    r.route('sites')
  end
end
