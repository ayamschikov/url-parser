# frozen_string_literal: true

require 'sequel'
require 'dotenv'

Dotenv.load

DB = if ENV.fetch('RACK_ENV') == 'test'
       Sequel.connect(ENV.fetch('TEST_DATABASE_URL'))
     else
       Sequel.connect(ENV.fetch('DATABASE_URL'))
     end
